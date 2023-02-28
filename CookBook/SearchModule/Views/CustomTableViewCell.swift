
import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    private let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "tableImage")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let recipeName: UILabel = {
        let label = UILabel()
        label.text = "efjifinfnf j ofjo jofj3j 3  j3of3jofj3"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let recipeDescription: UILabel = {
        let label = UILabel()
        label.text = "efjifinfnf eroeveorn enenio uen ineui neiurenfeofneofn ern fei nrfin eifn iefn ei nernf ejnenen"
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemBackground
        selectionStyle = .none
        
        contentView.addSubviews(recipeImageView, recipeName, recipeDescription)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            recipeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            recipeImageView.widthAnchor.constraint(equalToConstant: 170),
            recipeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            recipeName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            recipeName.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor, constant: 5),
            recipeName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            recipeName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -130),
            
            recipeDescription.topAnchor.constraint(equalTo: recipeName.bottomAnchor),
            recipeDescription.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor, constant: 5),
            recipeDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            recipeDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
}
