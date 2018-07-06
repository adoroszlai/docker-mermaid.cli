# Docker image for mermaid.cli

Docker image for [mermaid.cli](https://github.com/mermaidjs/mermaid.cli), a command-line tool to render [mermaid](https://mermaidjs.github.io/) diagrams.

## Usage

 * mount a directory for input/output files
 * specify options for mmdc

```
docker run --rm -v $(pwd):/mmd adoroszlai/mmdc [options for mmdc]
```

If invoked without options, prints mmdc's help.

```
docker run --rm -v $(pwd):/mmd adoroszlai/mmdc

  Usage: mmdc [options]

  Options:

    -V, --version                                   output the version number
    -t, --theme [theme]                             Theme of the chart, could be default, forest, dark or neutral. Optional. Default: default (default: default)
    -w, --width [width]                             Width of the page. Optional. Default: 800 (default: 800)
    -H, --height [height]                           Height of the page. Optional. Default: 600 (default: 600)
    -i, --input <input>                             Input mermaid file. Required.
    -o, --output [output]                           Output file. It should be either svg, png or pdf. Optional. Default: input + ".svg"
    -b, --backgroundColor [backgroundColor]         Background color. Example: transparent, red, '#F0F0F0'. Optional. Default: white
    -c, --configFile [configFile]                   JSON configuration file for mermaid. Optional
    -C, --cssFile [cssFile]                         CSS file for the page. Optional
    -p --puppeteerConfigFile [puppeteerConfigFile]  JSON configuration file for puppeteer. Optional
    -h, --help                                      output usage information
```

## Example

The following example reproduces mermaid's [sample flowchart](https://mermaidjs.github.io/#an-example-of-a-flowchart):

```
cat > flow.mmd <<EOF
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
EOF
docker run --rm -v $(pwd):/mmd adoroszlai/mmdc -i flow.mmd -o flow.png
```
