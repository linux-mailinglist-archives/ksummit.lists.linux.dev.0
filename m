Return-Path: <ksummit+bounces-1025-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25578115E
	for <lists@lfdr.de>; Fri, 18 Aug 2023 19:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F79E1C2111E
	for <lists@lfdr.de>; Fri, 18 Aug 2023 17:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF66463A0;
	Fri, 18 Aug 2023 17:14:40 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC304693
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 17:14:38 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37IEkdA6017175;
	Fri, 18 Aug 2023 15:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2023-03-30;
 bh=+pccjXY/nIox+UIVrQgrauMUTMg28ICPwFWjXNVFqIs=;
 b=fRkZtTgXBgByNNjvxyM7G1TMh/kMAghpM6LJaCaiYgkyxuTgLmZK2Fq4TlbdLvuEplBI
 v103kGU0pvEcIRW+ytv/MIameiX08DzGMP+dFIqKjB7RWntVTXZDx/zKqZfzeEy5HPVo
 aWQgpDuahw4YNnXzqo3ZYPo4BHjKHer6bOmbrXVCj8Zp6bRoZ10N9pz8Yxo2+WppVAXV
 3Y07mf76qxXEEivXSXg78uBjDbeH+u8kuRLYfLss8+JChpIDkEMDNr+yZrdro+n6avgJ
 i9ZpAo3ndB25NHP1UjcaCeOXoNDrZba9vDNzdoc/JdFpJt2Stp0BUCcUXgsI91EGkQYZ 5w== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3se349m6cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Aug 2023 15:41:04 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37IFLe1m000676;
	Fri, 18 Aug 2023 15:41:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3sey0v1c11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Aug 2023 15:41:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSj9E0SJSFJwaTHIS+shhUqX8Y7nwzKkGqvcchQyQRe2HJn88kghhzSULPC2qyECHFpFRLApHnuxIg2dcodBGX8BZOIw4KInwm7ALylF9PiIuikMtCuL/VGDbqioiVynqZqbAbfgFLGISOafriitTFJHEa+PUCJ7Yyj5iE/s3FZVyFpuFNDaDs9ha0gmkLap9PjRmH3Qq5Eob/oDpXynF1scxW2z7WwcJVr/vDVCA0trKEYRV7F8ea3gi+mQJpmoycyiI9qNona88XskYfF1byzdjyPH5YqUNH2Kj1AUvH4wIp3z5qktUfuyyVJJWCYw3mAYEir6z1k2SEGAg4gt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pccjXY/nIox+UIVrQgrauMUTMg28ICPwFWjXNVFqIs=;
 b=SSRdSPmuEo8ZUdB61NCUC68GhB6fgWO3wzWt5Y89u5JYMBxVSSWxTKNw05HpEQljuEft3MxvWaJTdVdoAlBOI9kbP003a5qcVV9amAvLnJTAYoay1g8sBBjc748HP55YiTnp3WeRep5MsMh6fHpqFkKl92nLddZ5Q8mAMnJgDYm5bOwKypZBbReWGmwhfh7OTDOBF1igx4QOEje2KNpRQhmlR9ZA+IRGf7pk8XWS/BTDWv0e7QmT8CpMqDT688RUtvBfEm7qoEl0CnXxc03cf4nUsDORt6+gwyHA74oa3AX+FHcEfXnIl34CrsIjZfLuDI3ai4U2GCN51uyKDSzCaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pccjXY/nIox+UIVrQgrauMUTMg28ICPwFWjXNVFqIs=;
 b=ZN7yIVrNKbQcGtb1vLJYnkr41pTSTkwSf7iUUNzjcWPkc2ri2hL3O8u9TfA9I2tGWPsDlJNJip8dMzB2A0nVl6TqQKD0A5V/wDPGZJa3FXEhHwG/52GGF+6XrD4B24Q+I053XodCsFOfqE6bLCYP/0maxtH5bGWQtg7T0FcRH5g=
Received: from DM4PR10MB6719.namprd10.prod.outlook.com (2603:10b6:8:111::19)
 by PH8PR10MB6338.namprd10.prod.outlook.com (2603:10b6:510:1cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 15:40:57 +0000
Received: from DM4PR10MB6719.namprd10.prod.outlook.com
 ([fe80::782e:adbb:c83a:1326]) by DM4PR10MB6719.namprd10.prod.outlook.com
 ([fe80::782e:adbb:c83a:1326%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 15:40:57 +0000
Date: Fri, 18 Aug 2023 11:40:32 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
        Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <ZN-Q8AsMwaQ4JMP4@char.us.oracle.com>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818152629.GA13558@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230818152629.GA13558@pendragon.ideasonboard.com>
X-ClientProxiedBy: BLAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:208:32b::12) To DM4PR10MB6719.namprd10.prod.outlook.com
 (2603:10b6:8:111::19)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB6719:EE_|PH8PR10MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 2edab37f-9d80-4d37-fa9e-08dba00183b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r6gGgawCNdbFkQn/uePnQ18LcBCmD2mYJHvgfEvU3AKSkNhj8uCCmSlDhlumQPEW6hDERkpSM5pT06OLNuQcn20YGTC0e4CQIfiUGKSKZ+fIPw/oNbdPWy5LLHr+subdfOTw6LD3mJsjHe5dk005tt8YAmT7P63RSvN1Dij/XNxy28Okh39TVaYRJ2RB4E18ckuCBqk6XLILYa8eICVlbuUM7Fpa41eBOi6w3iJRwkL00eFWuJFZzdvd6+VoDH0jX4cHuoWz/EwL+Qi4Lqe33kPbwYdOLoj4CieiVGTuJs6qaxbLTt0xl42FLI/USrdLQvswy7Mt4ln4ChTmPghwo+mGr2i2F8MkCjhaTEyCYTzNY3SuHzQ7jiGcgYpUsbiHb0pr2T4AMbLo+0Ag3YDDf6dnKoRLV9rhDk0jakm2RGYxQThy3m0UCbwYqTow0v0yFR8aXnWSKCABZUIwzrUxDlUm1NzFIOWkko7SLIptaW13FJBWkIqJaJgZcfoZlDqfe7ePOoZ6frTRMQ2u+DDA9LpmJBWqOah8Dj0gvcoYuKaIk/WnVBMiNV+2I2i2MqTBtlISKzhR2nMtCisJoMh3ZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB6719.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(376002)(396003)(186009)(1800799009)(451199024)(6666004)(6486002)(6506007)(38100700002)(6512007)(53546011)(86362001)(26005)(83380400001)(2906002)(54906003)(66946007)(66476007)(66556008)(316002)(6916009)(41300700001)(5660300002)(7416002)(8676002)(4326008)(8936002)(478600001)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0tEZmtxZ3hJVUhXZDVJZkRpVWNEMzhVRjdYRkZxRVVyT0s5amNtQXF3NmRy?=
 =?utf-8?B?U1VKNEpwQzVHRm9nWlFhenlPYXVUV0hpcWhmTkY2RGJrSlpnczM4Y1RNS01Z?=
 =?utf-8?B?bkVnck9uOUt4TVdMWllKWVVMWXF1T1EzQTFPSXZydUpRK29MaCtOb25KTEdk?=
 =?utf-8?B?NDhSeTVUazFUcUdaRFNCSE1lZ21Wak82ZDV5Wm15SVlGUHpuZjVDWVJCcmFP?=
 =?utf-8?B?d1hpd0x5Wk1GT085aHVHZlV1ck8rbEtsZ0dxVUY3b0NFeGpDRG9lMzgyQWxV?=
 =?utf-8?B?TlpVTkh2OFZmcHMwbHJxQ2FPelo0MjJCVkFpZ3FIMzJvL2dGL2ZIRjg0dU1q?=
 =?utf-8?B?WTVGSHZaVkxja2tWUFJNaHZDREduSno2VmxuVkNrTUwxSDVOZkI4djVweko1?=
 =?utf-8?B?T0pjNjV2LzJnUFFPZld2aGlzTkJ5Tk1maUpSdEF4UW5jZGhDL25LMXpzajEy?=
 =?utf-8?B?cWtLQ2pIaHErMFBUZlhuV0VYQkhQTjA1d0JhN3gzL0lrcEJuWGxSL3NZbExu?=
 =?utf-8?B?SHNVdmdQNC9keWJCVHJUbTNOdnFQdE9pUE9oUnBmaHU1bmJHRUQ0OE5BN3FM?=
 =?utf-8?B?bndDdUtvK3I4U05zSlhub3RPWjRMdEFkTjNFb0hQWS9pSFlPNFpMUjBKMnZu?=
 =?utf-8?B?Zm5KR0txUFQ4TTZBMTRiZmdMZzRCanZ5WStoNUE1RzFRMzFVUEkrSUhUcHl2?=
 =?utf-8?B?c1g3dlhYUmJIL0ZKWFAvK2xNQ3B3cDRlYkRaRDJqSWN2RGpCMlhrSW5hbDhh?=
 =?utf-8?B?djVlWjdUMUFuYzNKaTArTnQrQW9DVXFPaFoyOHhSQ2VGR2JaMUtOaEZRNCs0?=
 =?utf-8?B?b1YxUFNJMXhkQXJiY05vK2xqWG4vdXhsVGhEdVZpbjRzdS8xdEM2TGRlNGpF?=
 =?utf-8?B?N1dOcmFlbzNBcUlLMDI2NkU2S1RBYWgrZWxITk1XSDFrb2pQNmJpcEdFczcz?=
 =?utf-8?B?ZG5yOVNQbDc4R291a2ducDlRbVBGWEhqVnlMbWJVQTczMkI3bHZRR3dnQ1JV?=
 =?utf-8?B?N0c3OWVwUWhOY3hRVFF3c2M5ZzhGeEpVbGpCY0htT3BGa0Z6N0hzaWV0QWJH?=
 =?utf-8?B?SHBhcnRSNjMwU09oMGRQMDljNmVHZjlYdkVWYm1jK3FndFpVYXZxZk0xYVI1?=
 =?utf-8?B?cnR2dkVUL1J1L05MS0hDdkk1ZnN3Z2lFT2t2ZzhCekx6VW92SU91ZmZSVVdj?=
 =?utf-8?B?SGdJd3kzeVlnL04yYmU5THNqTnR2ckUvTnhvTzh4TVIwMFdSQXdaMGdyYkE3?=
 =?utf-8?B?WStNYysrM2JMVWsrSXgvaVdHT3h1RlFVRGFHb3h0ZldCMS9URTFxTlMwcnc5?=
 =?utf-8?B?VmE0d3RZNHR1eDJLMnZCK3BoRFNseWVHNnhBUExUbGlvWm40YVJFSmJMU2Yv?=
 =?utf-8?B?QmwyeWlwWldwdTQvRDNOTG5GU0srZWFQQllQWENzcm4vMnA2a2lKaFZ2c1FR?=
 =?utf-8?B?SFptdGdSZ2lMODdhU1IzVmdvT2NoY211UldoZUMwTnhPUlJ2ZlorWkxkcWZI?=
 =?utf-8?B?UHNCMndnRFRKU0FGQmhJejJZQ1JjS05HczR5T3hqVUNzQjh1TFhZcTU2MkRR?=
 =?utf-8?B?V2haWXhUZThyS3ZmSVVqU1Ywb1ROMVQrbmZoeWdKWDQ1c01ka2N4VWwwT3d3?=
 =?utf-8?B?N2NUclk5UyszQXhrZ1haVE15UHBLL0VSK0hlRUVRUHNlNTNOTnNXNmdmaVdE?=
 =?utf-8?B?MEJLWGI2RTdHamUvaDBxL200ejRmejlmRFZRT2VaL2lQTm5lOXlEUjBtMy8r?=
 =?utf-8?B?cm5qUTRzNzR2OGc3QWxvVHFXeVI0WVUvdnVhMFA0bEJoeEozV3c4Y0xUc3ZX?=
 =?utf-8?B?bzVLV3dPb0g3UWVQZjk0eW9PQ1VYS0pVbXdZRHJ1MHlEc3R1NUhHVCtqL1ly?=
 =?utf-8?B?Z051VlErbWRTK1k3SHFVd1dvWk5ibWl6Z0hwRyt3VzJkNFgzdm5HczlPNTIr?=
 =?utf-8?B?WUVaWFdwRTRmU2RBTmt6NXdudlgwUWRXa1JjSjlVNVRiQ0RpWGhZTHpOQXFx?=
 =?utf-8?B?Y0tvTUJXa05NQ3poL01nTXhnNGx6ejl1K05LYkY1clhlbitjMlVzTm1ZWURQ?=
 =?utf-8?B?RUVWd0hXTjRyZllHaTFpL1hKZXhvbEprQVdEUUVNZDFWZTh4MlNGemtzdjlw?=
 =?utf-8?B?SU5qQUFyd3JRNkhYR2pBdU9iOFlCNGdiZitmWFo5SVJBWmhiMG85aUd0dVpo?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?V2oxUno4NVpycHpRV09xdUZLWXk0MDVTQlgzUEtkek05dWVEYVpZTE9BRm5u?=
 =?utf-8?B?MkFnVkpXUS9uMzB5UDMxVnJ1QVNkUFlWVkR2QTZtRWZ1Q0thSmx6MVFYV2py?=
 =?utf-8?B?dmJwUGhRSFFOc3Iwa1lmbG5ucFkxZTh1a2xCNnBKcnNxTG9FTkVpNWUwSFp3?=
 =?utf-8?B?b2hQRFpyRi8zcGhhM2VIdFdQaTBBRWxRVnU1ck9GaTBuZGZycUVvUURlS1Q5?=
 =?utf-8?B?NlFTcHhQVVk3dlI3UU5sVlNOdlIvNEJVY29mSEZDdEphd0wrYXNqcEtWQUFL?=
 =?utf-8?B?ZlU3UTNoUnBCZG40WVptMnZhbmNlMXdlMGdvVXMzSU84bWplN1NJZUtxYUtj?=
 =?utf-8?B?clIwQVEzOWVkM2FZd3krUytzclY2OXRCOXBHV0tsSk55dzNXSWhINnV4N3oz?=
 =?utf-8?B?RGNsZGxZM2twLzNwUm11SlFRNzZ5V290cllEeUZaZ21wRzdPcitDZ2hVVEk1?=
 =?utf-8?B?L2lhTEFhbEhlQ29raElGMEJkdlQweVdBeVh0U09wL2lLOURFc1lTNmtROHVG?=
 =?utf-8?B?a0ZTYU1wQ1ptRnpKVitjdjZpSkxSdHYwc0F6M3gveTUyOW9lTGNTQkNuR3Yy?=
 =?utf-8?B?T2x5dzhBazJJSW83S1lFTGZOamVVNlZRRTlCTWV2VkN2R0pFUXF1enFRVTc0?=
 =?utf-8?B?a091SjhqeWMza0w0M2JER3VleTlNMHFWWnR3OWJkeWdHUlRLUUU5MzIwZ2hK?=
 =?utf-8?B?ZFk1angyK1FCSkJSSzhoK0hZaUlyWDdRekNucFhtcko1Yzg0b2E0UnByeGpT?=
 =?utf-8?B?NmJPbkQyVjR4Sk5ZS1VWSjcvSXVnRnQ3b0hJUVNydkhkSjRTa3pwVXBUMDl2?=
 =?utf-8?B?OXgwaXIrOGQ4Tm5jR0VZTm5XaGZScFgzelBVcnE1eUlvVjBwcGtWT0JZQ2hX?=
 =?utf-8?B?bmlOYUp2VEhuV2JiVkhMcmR5SW9wdytYSTNlTGo1a2dJWThzcXpmdmpSYXd6?=
 =?utf-8?B?SVVRTldOWUNaU0c2RWJCNVZLUVNzRjdXSEx3VHpFOUpIRXdIUm9oK3hGSkxX?=
 =?utf-8?B?bDdWMmJreVFQMnIxenF1QWZVUFRCd2pHSXp4YklhWXhXNlE2cHoyaWxEaHdE?=
 =?utf-8?B?UHJVMnpKUjdlVi8rZDlyWGhkM1NyRWhUcmFXaENVSHVlNW0vd1BIRURzMkx1?=
 =?utf-8?B?amNkd1BFK3NRZitjWnlYbmgxR3YwZFp0R2JGTDBYV3AxSUFVbXlqWlJZcU1y?=
 =?utf-8?B?YlVwN3U5VTZ6UldXU2JvVml0N1JlaWowS09iTCs3K2RhQ2JUODY4a0RMamhr?=
 =?utf-8?B?NFpiUUZMMlNFQUxaTitSS1M5VjdSNS9wejBZdWtUZ3U0ZGxrdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edab37f-9d80-4d37-fa9e-08dba00183b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6719.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 15:40:57.1665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKdHaqmqoOZfyOq5yLSo7Rs+zuIn69om5e3QJApsW8V5Yz2gjwJ1KkDf2Gpz3xvd8LNwzbDp4tfv+Dw94vOCuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6338
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_20,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308180143
X-Proofpoint-GUID: 05zKgfFhwEU86YBx3Q_mLY5IrP3iz5kO
X-Proofpoint-ORIG-GUID: 05zKgfFhwEU86YBx3Q_mLY5IrP3iz5kO

On Fri, Aug 18, 2023 at 06:26:29PM +0300, Laurent Pinchart wrote:
> On Fri, Aug 18, 2023 at 03:55:11PM +0200, Linus Walleij wrote:
> > Alexei, thanks for returning the conversation
> > to this very important topic.
> > 
> > On Fri, Aug 18, 2023 at 1:55 AM Alexei Starovoitov wrote:
> > 
> > > BPF has solid CI that helps a lot, but the maintainer burnout is acutely felt.
> > > The main reason for burnout is patch flood.
> > 
> > I agree this is an important cause.
> > Even worse is any kind of social conflict or bad mood in the community.
> > Science has studied stress, what we mostly run into is called "microstress".
> > https://en.wikipedia.org/wiki/Psychological_stress
> > 
> > > The maintainer's day looks like non-stop code review.
> > > The patch backlog just doesn't end.
> > 
> > I've been there too :(
> 
> I think most of us know the feeling. Personally, if my workload reaches
> 100% review for an extended period of time, without having any time for
> "fun" activities such as hacking, I'm pretty sure my review efficiency
> drops drastically. Maybe that's call burn out.
> 
> > > We're trying to encourage active developers to be code reviewers as well
> > > via positive/negative scores:
> > > https://lore.kernel.org/bpf/ZJx8sBW%2FQPOBswNF@google.com/
> > >
> > > It doesn't help much yet. All incoming kernel contributors assume
> > > that it's a maintainer's job to do code reviews.
> > > Developers just send patches and wait. It doesn't occur to them that
> > > reviewing other patches will help them land their own.
> > 
> > The DRI/DRM community has group maintainership that works a little
> > bit.
> > Essentially it boils down to ask people to review your stuff and you
> > will review and also merge their stuff in return.
> > Sometimes this works.
> > Especially if you are a circle of acquaintances working full
> > time on similar things, yay! So much support.
> > When you are a sporadic contributor it doesn't work as well.
> > Because you cannot always find some matching contribution to
> > review and you feel like begging.
> > So different solutions for different contributors may be needed.
> 
> I've also experienced mixed results from "trading reviews". It's
> certainly nice on paper, and it works sometimes, especially when asking
> contributors to review patches that are directly related to their
> business interest. I remember asking a contributor from a large company
> to help me with reviews, to free some of my time to review their
> patches. The contributor helped with reviewing third-party contributions
> to the driver they're actively working on. When I asked for help
> reviewing an entirely separate driver that their employer had no
> business interest in, however, I faced the "we're busy and don't have
> time" argument.
> 
> Maybe part of the solution here, to share the maintenance burden, is to
> expect contributors, especially the ones with large financial resources,
> to spent a certain percentage of their time reviewing code that is in
> their area of expertise but not in their area of business interest.

May I add an point that I had struggled in the past with (and it could
be very well this is not an issue in your subsystem in which case please
ignore it):

This idea assumes you trust them to have the same level of expertise
that you have.

That is say they do a review but miss the more esoteric semantics (say
hardware quirks that are documented but only for folks that *grok* the
hardware). You may know it, but they don't. You accept their patches and
months later it all blows up. You are unhappy, Linus is screaming about
it. Burn-out ++.

Perhaps the question should be: How to grow the community so that members
collectively have the same knowledge as you?

(And then you can take days off without feeling guily. Burn-out --).

