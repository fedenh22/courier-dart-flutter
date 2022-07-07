final class AnonymousObserver<Element>: ObserverBase<Element> {
    typealias EventHandler = (Event<Element>) -> Void

    private let eventHandler: EventHandler

    init(_ eventHandler: @escaping EventHandler) {
        #if TRACE_RESOURCES
        _ = Resources.incrementTotal()
        #endif
        self.eventHandler = eventHandler
    }

    override func onCore(_ event: Event<Element>) {
        eventHandler(event)
    }

    #if TRACE_RESOURCES
    deinit {
        _ = Resources.decrementTotal()
    }
    #endif
}
