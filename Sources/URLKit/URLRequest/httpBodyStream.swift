import Foundation

extension URLRequest {
    public func httpBodyStreamData() -> Data? {
        guard let bodyStream = self.httpBodyStream else {
            return nil
        }
        let bufferSize = 1024
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: bufferSize)

        bodyStream.open()
        defer {
            buffer.deallocate()
            bodyStream.close()
        }

        var bodyStreamData = Data()
        while bodyStream.hasBytesAvailable {
            let readCount = bodyStream.read(buffer, maxLength: bufferSize)
            guard readCount > 0 else { break }
            bodyStreamData.append(buffer, count: readCount)
        }
        return bodyStreamData
    }
}
