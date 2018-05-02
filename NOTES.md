#### Implementation notes

```
./raxx_upload_example master
❯ print -C1 ^.git/**/*
```

###### `mix.exs` 
- ace and raxx dependencies 

###### `config/config.exs` 
- config uploads directory, chunk size

###### `lib/upload/application.ex` 
- starts Ace and Upload Router, configures for cleartext

###### `lib/upload/download_service.ex` 
- provides chunked downloads, reads files from disk

###### `lib/upload/file_reader.ex` 
-  not sure if it's async - strange construct I don't understand 
```
  @type t :: %__MODULE__{
          file: File.io_device()
        }
```

###### `lib/upload/file_writer.ex` - as per file_reader

```
  @type t :: %__MODULE__{            
          file: File.io_device()     
        }                            
                                     
  @type name :: String.t()           
                                     
```

###### `lib/upload/not_found.ex` - simple not found handler
###### `lib/upload/router.ex` - set up the  PUT and GET handlers for "uploads" path
###### `lib/upload/upload_service.ex` - handlers for PUT (head,data,tail) chunks 
###### `test/test_helper.exs` - boilerplate
###### `test/upload_test.exs` - needs impl 


