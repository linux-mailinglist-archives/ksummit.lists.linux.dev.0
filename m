Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9867E5F86
	for <lists@lfdr.de>; Wed,  8 Nov 2023 21:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7348EB20E2F
	for <lists@lfdr.de>; Wed,  8 Nov 2023 20:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E43A374C4;
	Wed,  8 Nov 2023 20:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="msg8HXj9"
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A83F37140;
	Wed,  8 Nov 2023 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A8FQYbm028565;
	Wed, 8 Nov 2023 20:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : subject :
 date : message-id : references : in-reply-to : mime-version : content-type
 : content-transfer-encoding; s=S1;
 bh=6l2NWaUmA2eipxGR04HepdML4/2RZCq+AqUbt4HpdNI=;
 b=msg8HXj9jZi6zB8so0MLpW5++VcVZbkIoTytCoENTHoobvriZtxVFraoSo7Z9QirvVPG
 gbQAoCGAkmKHgZLtZt2N+ucqBSpiII8vu7k/mOmGPiBzVY1ooid3pn3qUxQusZTtaBGz
 JINzf32s7CT5+Y3BGh6q0B1Me4A4PF/nK39in4RXjm1sA13l50xb5rlAqKehlcfAkHpr
 BO+/czWeyBBhxmHoRiVvKQXppU8s9UQeb6WuXhn0v/TozaQ6lzheuxDYrk6yVSXwBgeV
 b+3X4ZAy0IF5xY4rq81BBwP5P0GayFtYGnzEeVl/38Zex7FikqO4OGY6oTc2sheZKLL9 Xg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 3u7wn714vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Nov 2023 20:04:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtauryjB80F5fASysVr+bi5rO+yyUaoYTjUAitNhK1/Z51VFQmo/uC2CV6jRqgbs5RJXB/GlAANppjRd6z+mbstxxkJPKreokJJG9060JbpxsPotjGceb9TCQO7tZuUOa+k9Ks51b0gdmc5+P3K3/+bn/hf+YRynG8j4igJUVggmu8KYDvbztBc0UjCTF56KfS57omTkzCm/e5cyMqLOMBZg7gX6XpAAkUYaL56YRk3L1/o89krNWpP1tG8yNcT9tYIUa2EeGB6kxBrrDehnCJPwpD2kLfji13fFEQg/UQvn5Tpi0Nza2cBQtFEs/Q575yo2Hr7Y0x+/YSrDmsDTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6l2NWaUmA2eipxGR04HepdML4/2RZCq+AqUbt4HpdNI=;
 b=Z1ffvTI+vu3mGUI7TmiGtzxA5HUajCr08geQy3T6rnN+G1+Meb4yPzWga6cc6K1kMRFuoYXKO91HLVeUnlVCFeH1GiBZIppxThW6seKbH7I1YNgXk6XbVs3V07p55VSinA4+Qpqrtd7ehyE5Nn4luJrXpTi19CaWIudPOM75PcCJ2L0bEr5U7pEq7ws1oiN/SDiQ1FzYWTw05x5o/47XNlBZMcGaJTQTU774qyTnwwxaMvDnpUOKxz055OPQFzGg7ju6iH/ib5MI2BiyrxQt/vVUYwLgwBiJYltz0uiwxpZ8qCBf2Ltn2NWt0OfpAUSgGlVEgMkO5zmkdkxy6dBu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BN8PR13MB2738.namprd13.prod.outlook.com (2603:10b6:408:8d::28)
 by BY5PR13MB4437.namprd13.prod.outlook.com (2603:10b6:a03:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 20:04:21 +0000
Received: from BN8PR13MB2738.namprd13.prod.outlook.com
 ([fe80::58b:bf63:b6b:706c]) by BN8PR13MB2738.namprd13.prod.outlook.com
 ([fe80::58b:bf63:b6b:706c%6]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 20:04:21 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "users@linux.kernel.org" <users@linux.kernel.org>,
        "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>
Subject: RE: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Thread-Topic: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Thread-Index: AQHaEMaavGQM9oFSz0ChIsTpMB17DrBw2eSA
Date: Wed, 8 Nov 2023 20:04:20 +0000
Message-ID: 
 <BN8PR13MB27385D63AA7DAF65B6CAAA34FDA8A@BN8PR13MB2738.namprd13.prod.outlook.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
In-Reply-To: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR13MB2738:EE_|BY5PR13MB4437:EE_
x-ms-office365-filtering-correlation-id: cab4cf73-8c4a-4b10-63be-08dbe095e52c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 leQayzRu4H3weiv4kZpziMSzUF5KFyMqbaewMF6JUP4owgjNxAF7Hq6lvAVqb3nqfWu8OlzmMm6I5Vwu2NgMnxMIyjTNzCKUsz2auckkcdwyWj8jtu8whVx9+1VKZb5gt5vN1TD/X1QPa2vAAlPC/3UTRkyCGWW94zuOemLtMrzvmF6UHnwYc3dSuf9T7WCcBS17ZUdBfbDL3GTGMzskR1U5DyycQZQeZkUN9zM7wN7uhuYpYokdhj3hvqyxLrDNsitj6ZgLtV4u+YsbgNMSTUXxhHWToyIwdfvUGGA3wCzosTfS782LqzReVA+HTcySPLvJxHzba7Azn/GXXwkq3NUKKqNGEisU78es9ssD1yD49n8g+VGlmyb6TlbTvpJtK5OKAiJS1LQgF1B5WgjyDuUPGVpPQPhV7GBjiwJVi8zCAF1JpKf487xB8s3TF0Lbec+8bf2wN3cd3vyHedF/AVVQswXfY8nKtzx7yOg9vGdnXpO2T3WSbzOf0JYevYFF4i3vZv6X2XHa2Pqtx8tQpLn4AU6Ei0eZY9nxYNkM/JxejzADMWVM0xBYmugb8II5zeQYzhGvpfweggmrFyPd8B9C+xQs5LHmZ03N7VsAlVsRzya6Mceg9JjbiF3kC1sw9q5yJzjxnfdqusorbaQ4myl+a4wWJz6aA1AyZ2xzWP4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR13MB2738.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(41300700001)(478600001)(9686003)(71200400001)(6506007)(7696005)(8676002)(52536014)(8936002)(316002)(83380400001)(2906002)(5660300002)(76116006)(110136005)(66476007)(64756008)(66446008)(66946007)(26005)(66556008)(38100700002)(82960400001)(122000001)(86362001)(33656002)(55016003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TEx1ZUVRZGw1YXRjM2R3aTlwSGlEdkp2Z1czRUt6Y1M4SktVNHhKS0M2WXNt?=
 =?utf-8?B?dnV4RWx2Vy92ZkZmRlBWMElJa2dGd1k1UWRvYnBaeHFQcG5RWWdYckEyYlJq?=
 =?utf-8?B?ekE3SURJMzFndFlwRkhnM29PM3JIbGs3Rjk1RjF3QXBMdEwxWmE3M1NJek9u?=
 =?utf-8?B?V2xEZFVuZUxKanladjVJSGFnYjE1MFBmZFU0WURHYlZ6aEVUUTdycGZYZGVM?=
 =?utf-8?B?OTY3OGNTUGx3eXRPL0wvSzVLWmlFeHZsTHY4YWI0UzRTZmIzZjhzUzljRzRj?=
 =?utf-8?B?bG12Tk5leS9ldk9NMDJBb2pEaXVKU2k4dklLZVRXS3J3NWNpc0pVTE1ORkp5?=
 =?utf-8?B?cDB6aG8vcjlwc0EwZ0F6dHFIbDZxaFZlMm1MNjc3Z1dCN0hZdms5Q2N0b0xK?=
 =?utf-8?B?OUQ5S3RvRVkzMmJ4Q2tJRkw0TVp3Mm12bkpxb0FQY2dzYko5NGRDRFNaZUds?=
 =?utf-8?B?L1Z4eHNraVZJaWJpYkFDTSttV3FHQnZDVTRkeFYzckZnYjJDYXBIVDBtRS9o?=
 =?utf-8?B?a2xuQ2UzRWNPMk1UdExoalArZ09RbGE3VDgyQ1BIUHVjbnY3QzhtRWNxNy91?=
 =?utf-8?B?QXNTN2VkL2pOeGVlNy9JSmVQZjZhaTRqUzNvWWtMN05ta3F6YmxXTExoMDVY?=
 =?utf-8?B?RE80b2cxTk1zNHZlZXB2bHVQQVlTWTlFYzlDa0ZzWlU5cWYrd2R3TTRBclNP?=
 =?utf-8?B?MFFld0lBTXRqR2FpQWk0RjBwOTJ4UmcrNHA3WXBlYUd4MDlzRWF6REtXZFRp?=
 =?utf-8?B?SzFsdlZsZEJubzdBNU9HMXg4YjViRFFrTzNQOWI1ay84d0NnU1ZJcGpVNFg5?=
 =?utf-8?B?aWZqNmlMdkprU2pmbGpsWHlFM0FKZTlpN2JLdks3QjdyTk9aaFJJVTFBRGJX?=
 =?utf-8?B?NFg3dHN6TjQwbFdKWmUzbDRBSTJHUnB5amg0WCtzRVM2TlJoQ3oyN0hUOUE0?=
 =?utf-8?B?MmVBS0ZDSDRTRmxkTmNFYmNSQWdpM3dOVkdOMmVaVE55Q0RQN0g4WklsZXdO?=
 =?utf-8?B?Tncvdi93eW1qOCsyTzN5S2RDUW5rNDZSR3dvMGdTZEhQbEdRRFJkQ1A2bU54?=
 =?utf-8?B?VS95NHBrdzhmL0FVRm1iZHFXWFRiUVhWRDY2ZHMrdUpnbjdjZ2xEbVJ5bUlF?=
 =?utf-8?B?QjNoVlZjeWZ3bVZBZE5GVklWSWxEWkZyNE9xa0ZneWkvRzVZcjQvLzFQOC9t?=
 =?utf-8?B?aUI1N1oxNnUyV05BRitveUJEVzVSMVBIemRMSWg3NXQ2d2QzOFhqN2NTb2M2?=
 =?utf-8?B?bGovMzVhaTNGUWZCS3U3dG1tWmhVVjdmRmkvNXRjRmxGU1pDYTE2d2pTek1V?=
 =?utf-8?B?YjAyWEFxOTRrOTJoVWQrZk9SZGtzTXgxbkx3VHg1bXh3M3RlR2piVURBc1ZO?=
 =?utf-8?B?Ri9WMm5YamZyM1hYcGFKVFNSdEYrZnJYb2xlOGtSVndOUlgzbFl6RjYyTVB3?=
 =?utf-8?B?b1JuRkNmbHNCYXJlaFgyaVBGLzRHWlVIcHVqZXRNK0FGM2hORkRyUG1XZDkx?=
 =?utf-8?B?cld1VElrSU55UDl1R01IemQ3dW9ZRFM0WVA5VnVjVkM5UjErQjAycXlmejdB?=
 =?utf-8?B?alI3ZUpOc3FSNjYxbUwvcFRHQURCVHpSSXJRYlJicGF6aHdNT2QzU3BqNzdK?=
 =?utf-8?B?UGFsc2hGUjBnNWprUVdrSHBEN0RYYlFTdG40cDdNaG13MW45Mzk0Y3RvZEhX?=
 =?utf-8?B?Q05XUzVIRitlRUFKS0xnZFdSVHhkcWxkbHUyL0JqZ1N6b0RIUFdhcWN1bE5R?=
 =?utf-8?B?UTdEbkVWUFluZVQyd3ZxMWZhUGw2UXpHOU9BUjFmRzk4Y2R4UlltTUh1U2lt?=
 =?utf-8?B?RnBwUE0yMEswTWtRN25Gcmo0bjVOOFFZUWoybjZtWkpFVXE1bWk1SmZ2ellT?=
 =?utf-8?B?RHQ0VFR1bDdUdUU2Zi9MSmRaK1lKUFQxWVh5TlNqeEZMcGFmb1plWUUwc05t?=
 =?utf-8?B?ZCtMOCs3TVpvSDBuMzVMMFp2MzhScTI1aDZwcS9VTkFuZjNFcVJzWVE1VkR1?=
 =?utf-8?B?QnZVLzhVUXRKOUxrdnpjODRadVdVYVhuVVkwM3VQNCtNVW81OGJ6ZW45RGNq?=
 =?utf-8?B?SEl6Q1Y4VW5GM1hDUTJ1ZFlJL3F2bzdXd1BDaElZRXZOb0l4MzliUHo2N1kw?=
 =?utf-8?Q?xzxc=3D?=
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ugmugqnGkpPnBktR5zEyC/komL7DiYhd1OhY+h4Zdnm7zLPXDTQN4XD8gvqO8vzQChqwuBHbTY61c3roeI0ZaEy3bzgdcEk+adYwh3AgIcQfHRKsDC80S6Md6UpDZ8ZdIa2tXGps3pef4/sdXMmA+7YiARM3Y+Xiie8TfN8xtynzH8UP3SZ/Bm4gNcTK5BGF1sqfmLUCTbZLXe8/qNVNVMK3j94bwVtttY4+UMDuspKCh7x//tP+HffrY5lAJi27DE0CeTYApyvtqangM9zjlQRghlMgGEuVkknAX93erJM3f+7kjMaoFAItuGx3gqMC9rhV+kCHOkN6AdzuSUSvOrAG/FqA1nU9CwtAVnXX3hpoPE7RdEZXDWN9xr6gaxkDTqEd95/84w/AToNp2OmDdRjjf9s8vBH2E3xCTVYrYYa7b3tVuKHwvAeYZ29JwKmSfcsaHIDtKiQxA13B1Rx2iyL0ctpA/yweSMtz9B34eeX/C177mt6AX3kQ2GAoUsIirSTzsRXxXN//248hPTuRSMioUrHD9B79nPmzRrrzeVJ3joT0/HNcLDi9gmlfpsdY5VoHHwqpsKay/xcSdgw682nPsM4u15/u6q3zEkmMcs4+eDWkX4cjd9OmrJhbp8dm51W3aL3xJiGS9lKLmnAxAZfU7TA3vBFs00NeE4gk/raEk5+IzOYVJJ0O/NP3n6fsyNOmgOCEfcAiZhiHohy7SdkSOx93zjkvqWEkE6K72ZeUfBsQpjUlROEWmGAW1IzrNnSHqrajOBMuOMdDP3LZ+Z7SakxLQwCY0E3niXeTzH4iuvpbOOIK2MSZFQl0DsKK+lFI7DavVgjBogBmS2o0Q/ieJzv0A9KJKdOGZE23JYhiUvxUN8GDMOgZJyu0Pq4K
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR13MB2738.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab4cf73-8c4a-4b10-63be-08dbe095e52c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 20:04:20.2522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R4/115GPhH0idsadODOWy7EwaUZEDwwQx74Sk7kuWVWiv9833q7jCV6BFX166VGI21WVByW0GADbkAKgquKYjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB4437
X-Proofpoint-GUID: NJSCIC2NErIm0AdJUVhri5NQYX5J-SIP
X-Proofpoint-ORIG-GUID: NJSCIC2NErIm0AdJUVhri5NQYX5J-SIP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Sony-Outbound-GUID: NJSCIC2NErIm0AdJUVhri5NQYX5J-SIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-08_08,2023-11-08_01,2023-05-22_02

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS29uc3RhbnRpbiBSeWFi
aXRzZXYgPGtvbnN0YW50aW5AbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gRm9yIHRoaXMgcmVhc29u
LCBJIHByb3Bvc2Ugc3dpdGNoaW5nIHRoZSAiRjogKiIgZW50cnkgaW4gTUFJTlRBSU5FUlMNCj4g
KCJUSEUgUkVTVCIpIHRvIHBhdGNoZXNAbGlzdHMubGludXguZGV2IGluc3RlYWQuDQouLi4NCg0K
PiBUaGlzIHNob3VsZCBpbXByb3ZlIHRoZSBzaXR1YXRpb24gYXMgZm9sbG93czoNCj4gDQo+IC0g
cmVkdWNlIHRoZSB0cmFmZmljIHNlZW4gb24gTEtNTCB0byBtb3JlIHJlYXNvbmFibGUgdm9sdW1l
cw0KPiAtIGV2ZW50dWFsbHkgZ2V0IHRoaW5ncyB0byB0aGUgcG9pbnQgd2hlcmUgc2VuZGluZyBz
b21ldGhpbmcgdG8NCj4gICBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIHdpbGwgYmUgYSBy
ZWFzb25hYmxlIGFjdGlvbiBhbmQgbm90IGp1c3QNCj4gICBzY3JlYW1pbmcgaW50byB0aGUgdm9p
ZCAoc3BpdHRpbmcgaW50byBodXJyaWNhbmUtZm9yY2UgZ2FsZT8pDQo+IC0gdW5jbG9nIHRoZSBv
dXRnb2luZyBxdWV1ZXMgYW5kIHNwZWVkIHVwIG1haWwgZGVsaXZlcnkgZm9yIGV2ZXJ5b25lDQo+
IA0KPiBQbGVhc2UgbGV0IG1lIGtub3cgeW91ciB0aG91Z2h0cy4gSSB3aWxsIGFsc28gYmUgaGFw
cHkgdG8gZGlzY3VzcyB0aGlzIGF0IHRoZQ0KPiB1cGNvbWluZyBrZXJuZWwvbWFpbnRhaW5lciBz
dW1taXQuDQoNClRoZSB3YXkgSSB1c2UgTEtNTCBpcyB0byBzaG92ZSBpdCB0byBnbWFpbCAoYXMg
bWFueSBkbyksIGFuZCB0aGVuIG9uIHRoZSB2ZXJ5DQpyYXJlIG9jY2FzaW9uIHdoZW4gSSBzZWUg
YW4gaXRlbSBJIHdhbnQgdG8gcmVzcG9uZCB0byAodGhhdCdzIGNvcGllZCBib3RoDQp0byBMS01M
IGFuZCBzb21lIG90aGVyIGxpc3QgSSdtIG5vdCBzdWJzY3JpYmVkIHRvKSwgSSBoYXZlIGFuIGVt
YWlsIGluDQpteSBnbWFpbCBmb2xkZXIgSSBjYW4gcmVzcG9uZCB0by4NCg0KSXMgdGhlcmUgYSB3
YXkgdG8gdXNlIGI0LCBsZWksIGxvcmUsIGV0Yy4gZm9yIHJlc3BvbmRpbmcgdG8gbWFpbCBvbiBh
IGxpc3Qgb25lIGlzDQpub3Qgc3Vic2NyaWJlZCB0bz8NCg0KSSdsbCBhZG1pdCB0aGlzIGlzIGFu
IGV4dHJlbWVseSByYXJlIGV2ZW50LCBhbmQgaXQgcmVxdWlyZXMgSSBwZXJpb2RpY2FsbHkgcHVy
Z2UNCm15IGdtYWlsIExLTUwgZm9sZGVyLCBzbyBhbiBhbHRlcm5hdGUgbWVjaGFuaXNtIGZvciB0
aGlzIHdvdWxkIGJlIGdyZWF0Lg0KIC0tIFRpbQ0KIA0K

