# 2024-NC2-M28-Music

![Frame 10](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-M28-Music/assets/118119110/5bc39a7f-c1c1-4e28-88b8-e022f6cd214e)

## 🎥 Youtube Link

(추후 만들어진 유튜브 링크 추가)

## 💡 About MusicKit

### MusicKit

> MusicKit은 Swift를 사용해 앱에서 음악 항목에 접근할 수 있는 프레임워크 입니다.<br /> MusicKit을 사용하면 Apple Music의 컨텐츠(장르, 플레이리스트, 노래)를 검색하고 해당 컨텐츠에 대한 메타데이터(제목, 아티스트명, 발매일 등)를 가져올 수 있습니다.<br />

### MediaPlayer

> MusicKit의 일부인 MediaPlayer 프레임워크를 활용하여 노래를 재생하거나 멈출 수 있습니다.<br />

## 🎯 What we focus on?

> MusicKit을 활용하여 Apple Music에서 노래를 검색하고, MediaPlayer를 통해 재생하는 기능을 구현하는 것에 집중했습니다.<br />

## 💼 Use Case

> "랜덤 음악 1초듣고 맞추기"<br />

## 🖼️ Prototype

![(프로토타입과 설명 추가)](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-M28-Music/assets/52277540/ec32e1b5-cc27-4441-b414-ad4a87e05074)

### 연도별 K-Pop 플레이리스트 선택

- 2000~2023년의 K-Pop 플레이리스트 중 1개 선택

### 퀴즈 조건 설정

- 문제 개수
- 제한 청취시간

### 조건에 따른 음악퀴즈 생성

### 음악 퀴즈

- 퀴즈 진행상황을 볼 수 있는 ProgressBar
- 음악 재생
- 단계에 따른 힌트 제공 후 정답 보기
- 정답 바로 보기

### 퀴즈 종료

- 홈화면 버튼 클릭시 연도별 K-Pop 플레이리스트 선택 화면으로 네비게이션

## 🛠️ About Code

### 사용자 인증 요청

```swift
// MusicManager.swift

func requestAuthorization() async -> Bool {
        let status = await MusicAuthorization.request()
        return status == .authorized
    }
```

- requestAuthorization 함수를 통해 사용자가 Apple Music에 접근할 수 있는 권한을 요청합니다.

### 플레이리스트 검색

```swift
//MusicManager.swift

var searchRequest = MusicCatalogSearchRequest(term: "K-Pop Hits: \(year)", types: [Playlist.self])
                searchRequest.limit = 1

                let searchResponse = try await searchRequest.response()
```

- MusicCatalogSearchRequest를 통해 특정 이름의 플레이리스트 검색을 요청합니다.<br />
- 검색한 결과 중에서 가장 연관성이 높은 검색결과 1개를 받아옵니다.<br />

### 플레이리스트에서 트랙 가져오기

```swift
// MusicManager.swift

 if let playlist = searchResponse.playlists.first {
                    print("플레이리스트를 찾았습니다: \(playlist)")

                    // 플레이리스트의 트랙들을 가져오기
                    var playlistRequest = MusicCatalogResourceRequest<Playlist>(matching: \.id, equalTo: playlist.id)
                    playlistRequest.properties = [.tracks]

                    let playlistResponse = try await playlistRequest.response()

                    if let detailedPlaylist = playlistResponse.items.first {
                        print("상세 플레이리스트: \(detailedPlaylist)")

                        let tracks = detailedPlaylist.tracks ?? []
                        let songs: [Song] = tracks.compactMap {
                            if case let .song(song) = $0 {
                                return song
                            }
                            return nil
                        }

                        DispatchQueue.main.async {
                            self.tracks = songs
                            print("트랙 목록: \(self.tracks)")
                        }
                    } else {
                        print("플레이리스트의 상세 정보를 가져오지 못했습니다.")
                    }
                } else {
                    print("플레이리스트를 찾지 못했습니다.")
                }
```

- MusicCatalogResourceRequest을 통해 검색을 통해 찾은 playList 안에 있는 트랙을 요청합니다.<br />
- 트랙에 담겨있는 노래들을 songs 배열에 추가합니다.<br />

### 노래 재생

```swift
// MusicManager.swift

func songPlayForTime(_ song: Song, time: Double){
        Task {
            do {
                print(song)
                let storeID = song.id.rawValue
                let descriptor = MPMusicPlayerStoreQueueDescriptor(storeIDs: [storeID])
                musicPlayer.setQueue(with: descriptor)
                musicPlayer.play()

                DispatchQueue.main.asyncAfter(deadline: .now() + time){
                    self.musicPlayer.pause()
                }
            }
        }
    }
```

- 재생할 노래의 id를 가져온 후 MPMusicPlayerStoreQueueDescriptor를 통해 재생 큐를 설정할 디스크립터를 만듭니다.<br />
- 재생 큐를 설정한 후에 음악을 재생합니다.<br />
- 지정된 시간 후 음악을 일시 정지합니다.<br />
