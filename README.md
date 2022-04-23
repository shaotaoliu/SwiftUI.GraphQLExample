# SwiftUI.GraphQLExample

1. Install Homebrew: https://brew.sh/

2. Install apollo-cli

3. Download schema file:
```
    apollo schema:download --endpoint=https://countries.trevorblades.com/ schema.json
```    
4. Create the query file (.graphql)

5. Go to Targets -> Build Phases, click the plus sign and select New Run Script Phase. You can rename it and then move it to the second line (before Compile Sources)

6. Go to https://www.apollographql.com/docs/ios/installation, copy the Swift Package Manager Run Script, and paste it to the new script phase. You can change the file location of API.swift, the file to be generated.

7. Compile the code. It will generate an API.swift file.
