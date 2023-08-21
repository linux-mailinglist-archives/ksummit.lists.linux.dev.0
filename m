Return-Path: <ksummit+bounces-1038-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F547830EB
	for <lists@lfdr.de>; Mon, 21 Aug 2023 21:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 198EF280F06
	for <lists@lfdr.de>; Mon, 21 Aug 2023 19:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0724111AB;
	Mon, 21 Aug 2023 19:24:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9516D4A10
	for <ksummit@lists.linux.dev>; Mon, 21 Aug 2023 19:24:14 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37LFxTGw003604;
	Mon, 21 Aug 2023 19:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=MHDjmCvPQU3MQz5WIMGU+eFqyJZomZKDj/A/BYr0hJM=;
 b=a2nd1LPA72srV3eY7C+vXlvIh8xdgd/hhcZMRTbBQLUI3BVdGg56k8wcPvNayuXDr2ve
 0EFhCOTIZJaUqQ+B+yjjKBzDwxq10xZD0Utle6rKb3PZmb32lWAJrhM7EABnj6CG9Cn2
 tOh9Sio8ULwSGmng3fcRxywKArLhYkWj2BiybuJnmVINtau7SefPLIpCS/t+E30g/Mzy
 6CqTkg7f8BKC5okcPa4yFqbaKWlpuacLZmJkXC7MZ8Sg8SlGY4thYr4rHuoQMfeNcNVE
 u6wwuPbkZm62c7y2b9lgWel14k5CmxvlQ3ukXyC7U9DEUWCKsvG2R9VEfXf1aqBx5hPa mw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sjmnc3p8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Aug 2023 19:23:58 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37LHtvwc017593;
	Mon, 21 Aug 2023 19:23:57 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3sjm6ac95c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Aug 2023 19:23:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlEisOxALrwajTcmVkUBrKEg3b/kl7IkTXMBZ1K1izPeXRIcmYiRtOaQpWG4ke9YgPJScMe1iR0lS5aryUynTNLGWcuKMzSJM5fRLbLlZ9M8paLtdfOcr+i49JDCVHUpXhJUCtbeln6dUpcvX5beflR9sOqSkKgJZDVL0W1f04gPQJnqUFUf0FTJLPK23H1wPOpzy5bTL4VaG2h8ao2lS2gEeSEcas1GvO0CqFjGBM/03zrN3A8Tmh2OL5oVuQULeD/5Db8LYxmsKlUdUPXPTseHuUk3AKcLQ2vRy/VSFpRxi1ZVVdyFkjM+R43MK2zjjKusSQ+owjo9F2BV4u7zcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHDjmCvPQU3MQz5WIMGU+eFqyJZomZKDj/A/BYr0hJM=;
 b=ExX8nYcfB+cf499WunwAiS4fqkqRHf3p+eEIh95RfnK4JHDfGEH2keJwQZwpwJlrkcu/9LH3ajGP2y7dNHwUz/ez7QwoAljy7GYUYYgXcR6ZhtXnMjS4IMR1dXSXa1l5aLrBacu6A41WKCqQIjAq377wTsottyortdfhra3sZuH4SKanDWK0vkgYnsgQBknQxWJz6HcyLWGaNzChDehTl3ksLFK+qkD7LVoD1YsNw0I/1OpGWnTclkWtLdL17fWBeC1BVprAtYaTdkH6Y4+pN8UjtAXNAuX6HaetGUWF0CqrtmGY3JLi3EhRKobp6Tex+6z+n1Ufji6K86jBNhEGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHDjmCvPQU3MQz5WIMGU+eFqyJZomZKDj/A/BYr0hJM=;
 b=hfXkroZWvDL1oT2HQuCR9Mri3W7wCpMZ1Hn/n2R+rJMlXdCWIIQvO5MUhR0/4AwwbbtG9wSSA5Jc3u7WeTLN4dyELLC7KQF2G0G6XeJlBJYECJdBJCTEhOZMB0KvSiFrjDJUMSMkJxSMJHqvdb7CZ8Esq0ECaEa9/RKhtS8EGKI=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by PH0PR10MB4792.namprd10.prod.outlook.com (2603:10b6:510:3d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 19:23:29 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::76c:cb31:2005:d10c]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::76c:cb31:2005:d10c%5]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 19:23:29 +0000
Message-ID: <e7554530-a1a5-216f-9a17-7cf763ee6a9d@oracle.com>
Date: Mon, 21 Aug 2023 21:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Content-Language: en-US
To: Leon Romanovsky <leon@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Alexei Starovoitov
 <alexei.starovoitov@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
        Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org>
 <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal>
From: Vegard Nossum <vegard.nossum@oracle.com>
In-Reply-To: <20230819064537.GM22185@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0465.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::20) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|PH0PR10MB4792:EE_
X-MS-Office365-Filtering-Correlation-Id: 1111321c-f1f3-4286-9617-08dba27c179c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c4UBNmKjezVojN9wrATO96o/zFrkQuuVgI8aoGVELqDyv0TPN5M/FGqprDEMQT3oBBXqVsXLBon0exBf3t+8SPb5+g3K88uvohrkm4X1X8aJe7+Lq6LZXLhjgoeNypR68RiUM36TVTSYoRg9VtmrauqITQ1d4m3yAovzx2gfdHQYiPjcjqXpJgZ5qaeca4zk5pl8umSpnhzUevoM5fg+fpdXwzZOs3AayujBDPHrGhyIx1Pp6YJ/nr66eMepLLOoG+7HdOhi6tj8CdQgQjkTipb62hULS0GUlSAzLIBH1+gm4QDOCIMfdWLer6ou9z/8rb8DgfAmvyLxyY9va3SvZIqToxBiOj9fvwliYIuUNfJCGllE1/luZKjuK0FEFqrg3bVfKi9gPubSGSVV4EhW1KO2qYKfJ2XyWQjkk/NVARLicDoBialeeSARvQM4ti3hGyGDe0cNyl9spf38iM5VDUCooBgGkVqjcxPu4+zDbJKqdkGSs4B1sAAwxMHf+URZ4lugDom65cqDRvYs3v11LsuCFz7FFAq63hr3q5aB8qOcefbCD82B6ABzEjCGvpE/eqXQIjlQMV9nir5cJTSwUOXjYLFRO5qis6ScHYHLxwjw2SsfcwXT6VL70/aBqd0FLgIprKy670cbQBHBL1iWfg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(54906003)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(7416002)(86362001)(31686004)(31696002)(44832011)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cW9xZjFVMU1aajF6N2dnNUpicDJmZkx0b0Q1aXlQSm9aY2hhUjdpQW95TjVs?=
 =?utf-8?B?RnpZaUU0MCszK29peng0d3lJTjFqcFpucTVNcXkvNkk1VUZaNExKNzRHeGFt?=
 =?utf-8?B?RmV3MzNEeVQyYWxuaFNzS1I0TkU4bnNCZHRNWFRTdVlndTQrYUFveXVHMS9a?=
 =?utf-8?B?MlcyTG4vcnhXWjYzbHhNSTd5YmZEbUdYQXJBUzBNM1oyOTZjTFlUcWVReEtY?=
 =?utf-8?B?TkJoRFczSllNb1Awc0lwN0xlU3QzdC9SbVdrYUgwTEZQV0tIVU4vUXBwYzVr?=
 =?utf-8?B?RlllVEE1N0hPQVdCcHNrYWpDanZESnVnbmY2eGMrNW1tUXAzQUJQQm9zbWgv?=
 =?utf-8?B?M3pXZE10TXhWWG4yenVwdFdDTEdScmRscDBwdGxPQml6bUJNQk1KbFRndXNl?=
 =?utf-8?B?QXBUOEFiajVMcm5MU3RJc3R0bFpraDVLV1BrelhmcG9uVlRjcXVnZHFnQk9i?=
 =?utf-8?B?Nm50UGxta0piV3VubjlYbk5sQVJnS2ZaUUNaSmdqY3QvK0lVd2Y1QUVMMnlI?=
 =?utf-8?B?cEt3TEZuamVTb2pVVTFmYlFzZDBjTHZobnYvRzFMdGhnam45V1RGTmwvSW1U?=
 =?utf-8?B?MXh2aHBoSDBwVllOK1ZFRVdTdUlLelBFR043OThIRjZiWXRDL2tqZW5TZE11?=
 =?utf-8?B?R3dmRk1XSkhGSWY5Sld3Qm04UkJmRk9IQ0FNb3lyNUxIU2xNK3pSQ1dzTVBY?=
 =?utf-8?B?d3pJMm9uaWpoSFhyOTg3T3REbGRiaGhHaXZZRG5oTEpRTVpySmlacjZ0VE1j?=
 =?utf-8?B?bmp4RlpyTU9Mbk1LRFFFdEdmVXFESUJEMndBMlJEWFRtaURMd2VMTmRYa3lD?=
 =?utf-8?B?ajVjNlQzVUxCQW1IL3RtcTJmV1RFV3Z3NVZmdG9aTitFUXhYZlNwQ0VxU1Zn?=
 =?utf-8?B?QTZkQXNnR1EwQXNpQlBvdncxdmtKdXVnQVY4NDY4UmxUT3JJTGhpMXFnYmJ3?=
 =?utf-8?B?VDQyZERnZWM4OXY1SnFacCt5TG5rQ1ZYRjI1Q1h0TldnSXBiTXBDRmxkcnRk?=
 =?utf-8?B?dnVYNzgwb09lOTc1TkxxenY4aUFZMm43NFpYc1FHQ0pOdjRqaFI1NHN5RkNN?=
 =?utf-8?B?eUVYTkZVQ2FLbmZPVXl5YVE0Y3NVOTA3YjJ3TzFvYXlXZGgzbEtUbEs0YnBE?=
 =?utf-8?B?TlRGY0lHVnFvRHV5MGVIQitocWMxZSt3VzB1SmRhb0ppcVY2UGZXdndCWGZE?=
 =?utf-8?B?ZTVHYVV1R0U3c21TM09abVM1MHJXZGlhMVVtQkZmMUVxR0prOUZnZFFkNmNr?=
 =?utf-8?B?VGw3REt2clR5bnVhZ1BTSkJWcmthNFlidG9Ia1cxblFsTWpNZTlZNG9EY1dq?=
 =?utf-8?B?K3AyZWFwakREYm5BWDRtbDU2QmJBMnJHVHBQTjFiVkpwMEJxSkdoWDBvaTZn?=
 =?utf-8?B?S3ViUTJ6UUttMU1DWkV1UXcyRCtpM1pnVnpRZVFMVm5ZWk5nTS8xdk5oVzJI?=
 =?utf-8?B?cmw0MGRtMFE4NVNUNCtLOGJGR0MwRlUweStUSFlsYmxlejZSdUFNVUIydVpH?=
 =?utf-8?B?MCtmQXhmekFtT0hyeEsxRE9MeTJ6Qi9WMGhET2lSckh1ak0vdWt0bmFNL1pl?=
 =?utf-8?B?ZnU5UWNlc2JzaHcwc1AwSHlqbnRsQjlscVF0OTlLQ21ETHFtTG1qNWhuMGRk?=
 =?utf-8?B?Q2Q2NStUanpQUlQzRDBEUzErZzhWejFMa2M5c2EwVWtWa0lkeUl4NEYxeXBL?=
 =?utf-8?B?Vm0xOXJGMUp3RFZIQnQyemxhbHJJY1gzaHJpc1E3NTVLZVM0c3AvV2FSUGR5?=
 =?utf-8?B?NEJabE9GWHJWVDF6aHRoc3NlRTVIekovWEI2ZUhMTU9sVUtNdTBaSm5uWlRr?=
 =?utf-8?B?Ym1wNS9mdXhrK3NrZHNkTmQvWmx4K2MyRVhGZU5pUnFnbEt6YUJrZWoreVEx?=
 =?utf-8?B?ZzR2a1FabFZNdUdPK2NxaHpUeG13Qy9RWmZLTmVMUkpCK0p6bFVGaFBodUZP?=
 =?utf-8?B?NVU4TjZXNncwNXUrYTB5NVBnclNXbWJyRUhUdzB3NEIxbHlEdHlndmlha3pQ?=
 =?utf-8?B?M0RnN3NMYTFmRWZYeTRYYWRxU3VFQ1hLSDQ4U0JJYTBYL3RXZlhiVzlsNmNo?=
 =?utf-8?B?MjFlVmVBRTlHYVNXdVRRZGREM3VrbTJiTlpoVVhEdUpEZEsrd1NnRWxGM2dF?=
 =?utf-8?Q?ye+bDcHPG7eXi6a8IkpRQTkDf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?c0t2RmpBQ2RDS2NNemJUUXNUNHVLNGpqbERxOFRUSThTdG1yOVVhZEFBUHRP?=
 =?utf-8?B?bk5pWWplL3ZqNFJHMmR6NG8xekdxbHpObVpTcDdFQURyTW9iQnZqV2c1LzM2?=
 =?utf-8?B?eE9GdkJhTVMzRlVvajczL1h3c0F6eXJJRHo2RU9FU2VTaGV1WHFYdE5wTVRo?=
 =?utf-8?B?cU91M1VJMzR0bVkyVktDTS8vcE80ODdCYk9qcUpCQTJRSzBFbVFSajM1bGhT?=
 =?utf-8?B?LzFTb3VVS0pTbWR1RnpEdFZiM3BuU2FaWnpSYUUwaUFPQmw4UmpmakNiNzRU?=
 =?utf-8?B?VmR1Q3ZLbjhaV01Ya09ydlZxUWhsOWxFK2NLZXRIZUMzYWFLaHRlbno5OVFS?=
 =?utf-8?B?Z3NRZzlLa2JSVnV6OXpIam1LVjdmYzQxeW1USmhWdlBoVkFsNHEwaUdKREJY?=
 =?utf-8?B?bzA3TFFlazJsWWNMMy8vUWRGbmt5VTVmaWx3Sm1MaUtjU2pwbUFaZnNMWk80?=
 =?utf-8?B?MUhieTUvWHpabklYKy9aczhrUEtrS1hrODJyc0tWUWpybi9xQUVaMzhvVDEz?=
 =?utf-8?B?OGgyN01SeHQxdXc3TFNDbTRIUzRIRzZLKy9FbHRKeEtka2g4M2d6TUZHaHYz?=
 =?utf-8?B?MFlMTXRSYklFUk1EbnZEZklYMFZzNTgvNGV1SVo3cjIxRGpWUlVZN0J0NDd2?=
 =?utf-8?B?YjZGdkdOS0xKQ0p0bTdBOFRMR1N6dVJnaU0rRTRlTTRpSVJ2bVNWTVMvY2Z3?=
 =?utf-8?B?akNtc3NrT2xuMnNxeUwxeU5QSllmZ0pzQmprZ25kU1BIRm1zbytPK2J5MkVE?=
 =?utf-8?B?enpDazIyU1hnRmpoM2NzMzROdUtXeC9waXZJU1o3cU85ZkpUWWNJUk5OUUts?=
 =?utf-8?B?SXF0ZVJTNngxTExFRlQvZjArLzBwZkwzdk90aDdjaFpyUFMwelJHUy9sZmIw?=
 =?utf-8?B?aUsvcHUrZmtvV05rRDhmYWUrK1ZwK0llN0lSeU15dDJXanAxY0VwL2tEV2tM?=
 =?utf-8?B?L0ppMTR3aGNHdmxIU1VESjBrMkVTRUZKOS9SWEtrTVk4VHB1STRyRWVDMmVU?=
 =?utf-8?B?TWpCT2VBMXp5dlBkOS8vTXdOTnRnNC9XdGpnNll3dmxqRnRPYlJKMXQ0WHcw?=
 =?utf-8?B?NDhSUFpIakEyUFdPUTNXZngrMEJzYXljYkowTEF5ZXMrUlR2a1hTTE92NEdv?=
 =?utf-8?B?VVBMVnhUbExLc0o4U1pOOEpMU1dXMzgzVHhIcXFqaG1lWERZaUo5d3hENnh3?=
 =?utf-8?B?YzNkSnRabEd6bWR6N1A2aVoxSU14N1Nwd3prdFVocWtoSjhXUXdEZ05Gd0V2?=
 =?utf-8?B?R0pZVkFXczVjVDJha3c4djVYbjNreW5LWVkyT2R4WjlhU0hKWU5pUUhITnpV?=
 =?utf-8?Q?Hy204ETRkiROrZHoKkvP3q2aTjFn4uSAjA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1111321c-f1f3-4286-9617-08dba27c179c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 19:23:29.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGzcna2TpniLqESF6CPutZuZQ/XQv4MxjWgpJIaLG/Kzapj9HbtBeV1pt1MlEpLTz0BoKsSm2ctvPuNkcIy5p9tcOMLKUT5DQGrq80hQzI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4792
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_08,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308210181
X-Proofpoint-GUID: eiNAx7AOt-ZHGLzz_Pso4FdglPkqFheC
X-Proofpoint-ORIG-GUID: eiNAx7AOt-ZHGLzz_Pso4FdglPkqFheC


On 8/19/23 08:45, Leon Romanovsky wrote:
> It is worth to try to get honest feedback from active developers/contributors/vendors
> what is their "real" excuse for not doing code review.
> 
> I saw in this thread about "have no time to do code review" answers and we
> all can relate to it, but IMHO it is just an excuse and not the real reason.
> Especially for a people who are employed by big corporations to do their
> upstream work.

Hi,

For some drive-by or would-be reviewers, at least, I think part of the
problem is perverse or misaligned incentives.

If you write code and your patches are accepted in the kernel, it counts
towards your commit count, which is a metric that people look at, for
better or worse (probably worse).

When you review a patch and you find some problem with it, the patch
will NOT get accepted in the kernel (at least not in that form), and
your name will NOT appear in the git log. So in a way, in order for
your contribution to get recorded, you have to give the patch a
passing grade -OR- you are now on the hook to keep reviewing every
following iteration of the patch until it's in a state where you're
completely sure it doesn't have any problems.

(Of course, if you just rubber-stamp your Reviewed-by: on everything
then you are bound to be found out sooner or later -- or at the very
least seen as an unreliable reviewer.)

But let's assume you don't give out your Reviewed-by: without having
REALLY checked the patch thoroughly. Even then, mistakes can slip in.
In a way, being a reviewer and missing something critical is even
worse than being the author and missing something critical. Is it even
worth putting your Reviewed-by: on something if you're not 100% sure
this patch is not going to cause an issue? Are people going to trust
you in the future if you make a mistake in your review?

Let's say you're completely sure you found an issue with the patch. Why
not just stay silent, hope that nobody catches it, and then submit your
own patch later to fix it? That will get your name in the log. Even
worse, if it's a security issue you can maybe write an exploit for it
and either get a bounty from Google or sell it for serious $$$ to
various malicious actors. [Note that I'm not saying most people would do
this; I don't know. I am just using it as an example to show that the
incentives are disproportionate.]

The incentives that remain (as far as I can tell) are:

1) you get familiar with a specific part of the kernel, and
2) you get goodwill and recognition from other kernel developers.

Both assume a certain volume of reviews to pay off in any significant
way. Even then, depending on your ultimate goals, doing reviews is
typically a low-ROI activity for individuals compared to things like
actually writing code and submitting patches.

If the community truly values reviews, then I think it's necessary to
find better mechanisms for recognizing and rewarding reviews.

Can we maybe adjust the standards of the Reviewed-by: tag to mean that
the person has looked at the patch (or an earlier version of it) and
provided comments that show they actually put some effort into it?
For example, if a patch is changing a function (as patches often do),
the reviewer should add a line saying "error paths in foo() lgtm"
and not just tack on their Reviewed-by: line.

This adjustment would make it harder to just slap a Reviewed-by: on a
patch, but it would also make it easier to get your name in the
changelog provided that you actually put the effort in.

Maybe release notes/shortlogs could also include reviewer stats as a
bonus. I'm aware of the regular LWN articles covering reviewer stats,
but again, I think that only includes reviews for patches that actually
passed the review and made it into the kernel.

I suspect that review duty often falls on maintainers because they know
their own subsystem the best (and maybe also because they are the
reviewer of last resort). I think that reviews are a great way to learn
more about a subsystem and we should encourage newcomers and non-experts
to contribute their reviews (and get credit for it) even if those
reviews are not as complete as a maintainer's or subsystem expert's
review would be. And we can encourage that by nudging the incentives
in the right direction.


Vegard

