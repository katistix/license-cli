## katistix/license-cli

This is a CLI tool to help you generate a license file for your project.

### Installation

As of now, this is only available on Unix-like systems. I will add support for Windows in the future.

To install this tool, run the following command in your terminal:

```bash
curl -s https://raw.githubusercontent.com/katistix/license-cli/master/install.sh | bash
```

### Usage

To use this tool, run the following command in your terminal:

```bash
license <license_type>
```

Replace `<license_type>` with the license you want to use. A list of supported licenses can be found in the `/licenses` folder.

Example to add the MIT license to your project:

```bash
license mit
```
