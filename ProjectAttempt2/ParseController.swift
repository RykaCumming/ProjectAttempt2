
import UIKit



struct Product : Codable {
    let name: String
    let cost: String
    let prodid: String
}
struct Uowdca : Codable {
    //let page_id: String
    //let root_id: String
    let Products: [Product]
}
class Entry {
    var name_: String
    var cost_: String
    var prodid_: String
    
    init(name: String, cost: String, prodid: String) {
        name_ = name
        cost_ = cost
        prodid_ = prodid
    }
}
var list_of_product_entries : [Entry] = []
class ParseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let url = "https://static.ristack.nn4maws.net/category/2506/products.json"
        //Choose one of the below urls for url value
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data,response,error) in
            do {
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                guard let data = data else {
                    return
                }
                let uowdca = try JSONDecoder().decode(Uowdca.self, from: data)
                for product in uowdca.Products {
                    print(product.name + " £" + product.cost + " " + product.prodid)
                    let entry = Entry(name: product.name, cost: product.cost, prodid: product.prodid)
                    list_of_product_entries.append(entry)
                }
            } catch {
                print(error.localizedDescription)
            }
            }.resume()
    }
}
extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}
