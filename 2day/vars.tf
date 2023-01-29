variable REGION {
    default = "ap-northeast-2"
}

variable ZONE1 {
    default = "ap-northeast-2a"
}

variable AMIS {
    type = map
    default{
        ap-northeast-2 = "ami-035233c9da2fabf52"
        
    }
}