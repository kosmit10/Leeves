import Foundation
import SwiftSoup

struct Product: Identifiable {
    let id = UUID()
    let url: String
    let imageUrl: String
    let title: String
    let regularPrice: String?
    let salePrice: String?
}

struct ProductDetail: Identifiable {
    let id = UUID()
    let title: String
    let regularPrice: String?
    let salePrice: String?
    let previousLowestPrice: String?
    let sizes: [String]
    let description: String
    let shippingInfo: String
    let returnInfo: String
    let galleryImages: [URL]
}

func fetchHTML(from urlString: String) async throws -> String {
    guard let url = URL(string: urlString) else {
        throw NSError(domain: "fetchHTML", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    return String(decoding: data, as: UTF8.self)
}

func scrapeProducts(from htmlContent: String) throws -> [Product] {
    let document = try SwiftSoup.parse(htmlContent)
    let elements = try document.select("a.woocommerce-LoopProduct-link.woocommerce-loop-product__link")
    return try elements.array().map { element -> Product in
        let url = try element.attr("href")
        let imgElement = try element.select("img").first()
        let imageUrl = try imgElement?.attr("src") ?? ""
        let title = try element.select("h2").text()
        
        let regularPriceElement = try element.select(".price del .woocommerce-Price-amount.amount").first()
        let salePriceElement = try element.select(".price ins .woocommerce-Price-amount.amount").first()
        
        let regularPrice = try regularPriceElement?.text() ?? ""
        let salePrice = try salePriceElement?.text() ?? ""
        
        return Product(url: url, imageUrl: imageUrl, title: title, regularPrice: regularPrice, salePrice: salePrice)
    }
}

func fetchProducts(from urlString: String) async throws -> [Product] {
    let htmlContent = try await fetchHTML(from: urlString)
    return try scrapeProducts(from: htmlContent)
}

func fetchProductDetails(from urlString: String) async throws -> ProductDetail {
    let htmlContent = try await fetchHTML(from: urlString)
    let document = try SwiftSoup.parse(htmlContent)
    
    let title = try document.select("h1.product_title.entry-title.elementor-heading-title.elementor-size-default").text().uppercased()
    
    let regularPriceElement = try document.select(".price del .woocommerce-Price-amount.amount").first()
    let salePriceElement = try document.select(".price ins .woocommerce-Price-amount.amount").first()
    let regularPrice = try regularPriceElement?.text() ?? ""
    let salePrice = try salePriceElement?.text() ?? ""
    
    let previousLowestPriceElement = try document.select(".iworks-omnibus").first()
    let previousLowestPrice = try previousLowestPriceElement?.text() ?? ""
    
    let sizes = try document.select(".variable-item.button-variable-item").array().map { try $0.text() }
    
    let descriptionElement = try document.select("div[data-id='b06aaee'] p").text()
    let normalizedDescription = descriptionElement.replacingOccurrences(of: "–", with: "•")
    let descriptionItems = normalizedDescription.split(separator: "•", omittingEmptySubsequences: false)
            .map(String.init)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    let description = descriptionItems.map { "• \($0)" }.joined(separator: "\n")


    let shippingInfo = try document.select("div#elementor-tab-content-1361").text()
    let returnInfo = try document.select("div#elementor-tab-content-1362").text()
    
    let galleryElements = try document.select("figure.woocommerce-product-gallery__wrapper a").array()
    let galleryImages = try galleryElements.map { try $0.attr("href") }.compactMap { URL(string: $0) }
    
    return ProductDetail(
        title: title,
        regularPrice: regularPrice,
        salePrice: salePrice,
        previousLowestPrice: previousLowestPrice,
        sizes: sizes,
        description: description,
        shippingInfo: shippingInfo,
        returnInfo: returnInfo,
        galleryImages: galleryImages
    )
}


