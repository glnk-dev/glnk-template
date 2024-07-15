# glnk-template - Template Repository for [glnk-dev](https://glnk.dev) User Pages

Welcome to the **glnk-template** repository! This template serves as the foundation for creating personalized `<username>.glnk.dev` pages. It includes the necessary HTML generator and GitHub Actions workflow to deploy user-specific go link mappings.

## Features

- **HTML Generator:** Automatically generates HTML pages based on the `glnk.json` file.
- **GitHub Pages Integration:** Seamless deployment to GitHub Pages.
- **Automated Workflows:** Includes a GitHub Actions workflow for continuous deployment.

## Getting Started

### Prerequisites

- Fork this template repository to our organization.

### Setup Instructions

1. **Fork the Repository:**
   - Fork this repository to your GitHub account.

2. **Clone Your Fork:**
   - Clone the forked repository to your local machine:
     ```bash
     git clone https://github.com/<your-username>/glnk-template.git
     cd glnk-template
     ```

3. **Customize `glnk.json`:**
   - Update the `glnk.json` file with your go link mappings. Example structure:
     ```json
     {
       "/short-link-1": "https://example.com/long-url-1",
       "/short-link-2": "https://example.com/long-url-2"
     }
     ```

4. **Update CNAME File:**
   - Update the `CNAME` file with your `<username>.glnk.dev` subdomain:
     ```
     <username>.glnk.dev
     ```

6. **Push Changes:**
   - Commit and push your changes to the main branch:
     ```bash
     git add .
     git commit -m "Initial commit with custom go links"
     git push origin main
     ```

7. **Enable GitHub Pages:**
   - Go to the repository settings on GitHub.
   - Under the "Pages" section, set the source to the `GitHub Actions`.

## GitHub Actions Workflow

This template includes a GitHub Actions workflow that automatically deploys the generated HTML pages to GitHub Pages. The workflow is defined in the `.github/workflows/deploy-pages.yml` file.

## Contribution Guidelines

We welcome contributions from everyone. Here are some ways you can contribute:

- **Report Bugs:** Found a bug? Please create an issue.
- **Feature Requests:** Have an idea for a new feature? Let us know by opening an issue.
- **Pull Requests:** Ready to contribute? Check our open issues and submit a pull request.

## Support

For any issues or questions, please open an issue on our GitHub repository or contact us at support@glnk.dev.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

Special thanks to all contributors and the open-source community for their continuous support and inspiration.
