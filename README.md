# Digiturk Task
## _Beinconnect Movie Flow_

This app kind of clone app that part of movie Beinconnect on AppStore. 
Uses **VIP/Clean Swift** architecture. Has generic network layer and other best practices.

<img width="553" alt="image" src="https://github.com/ibrahim-demirci/BeinconnectCleanSwift/assets/75900229/03bb729a-e870-4b0e-b061-1ccd70b32423">


## Folder Structure

- **Network**: For network operations. 
- **Base**: Includes base classes for app lifecyle like loadingIndicator, navigation things .etc
- **Extension**: All of extensions in here.
- **Constants**: Constants in here, apiKey, base url, dimensions .etc 
- **AppDelegate**: AppDelegate and scene delegate in here.
- **Resources**: Resource fule in here, Info.plis, assets...
- **Model**: Includes data classes for network operations
- **Scene**: All of modules in here with VIP architecture.


## Tech

- **[Kinfisher]** - For image operations.
- **[URLSession]** - Network operations.
- **[AVPlayer]** - Video play. 


## Efficiency
- App gets movies when the relevant cell arrives on the screen. So do not make unnecessary service calls.


## Architecture
- **View**: Manages the user interface, receives user input, and displays information.
- **Interactor**: Contains the business logic, processes data, and communicates with the data layer.
- **Presenter**: Handles presentation logic, receives input from the Interactor, and updates the View accordingly.
- **Worker**: Executes tasks asynchronously or in the background, handling non-UI related operations such as network requests or file operations.
- **Data Source**: Manages the retrieval and storage of data, interacting with databases, APIs, or other external sources. We used for table view data source.

## License
MIT
