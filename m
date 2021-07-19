Return-Path: <ksummit+bounces-400-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7443CE07A
	for <lists@lfdr.de>; Mon, 19 Jul 2021 18:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 7E8463E118F
	for <lists@lfdr.de>; Mon, 19 Jul 2021 16:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCF32FB3;
	Mon, 19 Jul 2021 16:02:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F130370
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 16:02:41 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16JFqL2S014073;
	Mon, 19 Jul 2021 16:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Itaxox12e66a6Nkvm/f7WR6zFuON9Eef2sqwCJ4B834=;
 b=mQVZjWBLp8uUjHnBfB14YNtTXdOMEsgdxWll8+bo+MRbfqmSC5RQo1QAAr6ejGMnVCXr
 iKGr5I+LFMTm5y4QrW7rhMJBPzezoHwzNnyGND09nk2Aa1ntA9hnTb82aBvHmH6vyCRh
 qVo49x/5ygYxaSIf/Oqr/KLeTZ2i5MiE2yDiAU1IrfPi1Nuodkzb1PDLpz2ra7iX0IAe
 +V9iXLcXiGqjHDQ5UMYgEe+FvLr2j9h5N7SBIpiew3NjZA4rdKfwI9FVqd0Spe5/Z1CX
 nGDitvEm8SGXruerRqIBxwROXoAYmXUMLFo121mSJhe11Ac6MZmHGGKvtGi9ecPRzZOt Dw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Itaxox12e66a6Nkvm/f7WR6zFuON9Eef2sqwCJ4B834=;
 b=ArW9wUY2Ux1YgGE9T5N3FDqfxXl2upZKUv960nertaHFLliy0zAD1dXsU6euPEHcAX7z
 XjRQKf0UCAVb+yCaVDubolVvU4VavYaKpuTqHa+b/YWv+Vvba3rOajfDRS9KvB/RPkMj
 jX1FgY3Kd6dgOV+rEoT/5bOd6oq/n94aTtrYj2Sk52HM20tzUPwWJYAVbgYRlYD2/CFA
 2JUjI88MH2CMoNjxGmgY1JzS6Jh4IdhIzvwzGCqJ5UafulAREuuSue9MdZ+N1bYQATGo
 n4lMFKxjq/NCYSVIi1aj1Ql2pzTPs7dRaZOinuvD9MvfjGZXy0jPF7qAdp6iGjufqymU 7Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 39vpkwsuhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jul 2021 16:02:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JFoD5M069249;
	Mon, 19 Jul 2021 16:02:18 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by userp3020.oracle.com with ESMTP id 39v8ysxrmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jul 2021 16:02:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z04653wLcU07AbPgWkfsc3dR1b+CCNRcxS1ddX2Ph+96FljgKrzULX6vT2RX2WU9STdV7bzcGhdwiC0ecIZYj54ffrQC9C9UBWDlohccffIq0ulJ0w25+0UwyMGPkAJIakE4M5CePtbfRlLZMdLGG0mdKNEXYLWzgw/AYCJXbv6d52tZQS6wbefoglTrM8l3gjeYBNBjNWLxDvbquXOzDfO7Ep5tNvDbklPCn9rJHiqvNeH5rjOS0gxFveEzRakrdmekNdlWvBCNEPjTJzGKLaZx76vcLjI92Jdtswn0aOXhwPTlW5DRbqmQbT8PdWeSXmChW1vpPaBMTPQyDMa2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Itaxox12e66a6Nkvm/f7WR6zFuON9Eef2sqwCJ4B834=;
 b=AHZbvSXbwV2o5Jmzhav/GUXUvEVouERMOGw+joNP8PYzLtSrsm0N7bfs2wz86Ec3Tjyaoe77vgE/AzWLOosD1GNhb5yWZriCREPX8wMl/o31hwlUzkJrLqjWvT5Q+8iPS1OnWpsbJeIp/IRdC9N8NWFI5D6j9O23043DWB+9e4hvbFTRgCjTvjgpksuEagepgzI7402F2FSfj7GMcCBFqW/kE+nBH+AUPm7CGZ23DFaLCzAae+isf4XmlrsdLFPhfeA7nqodh4u082b9Gs9QlFQhdjo8o1VqXqbVsfrmsM9ZMNrj2jY3cvScLqUVO8cZRkh9mvGBeFnVUGjieUnNJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Itaxox12e66a6Nkvm/f7WR6zFuON9Eef2sqwCJ4B834=;
 b=YrweXw8DADXQmG1TZgbgVs2+l9NW7cP69JCyLS1RaYxQ8D60158D3Vc76Gn7v+KPI97s5uKO7jvZJg0KVwz1NKiGmnI/vHohwPMzaqqV+Mm1UGpgJvPZo4hJ6w7KM0R05keTcbPKzcGOduqs4mi3CP0jDZhDdSMAKdJIPIPD1iM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from CY4PR1001MB2133.namprd10.prod.outlook.com
 (2603:10b6:910:43::27) by CY4PR10MB1880.namprd10.prod.outlook.com
 (2603:10b6:903:11e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 16:02:15 +0000
Received: from CY4PR1001MB2133.namprd10.prod.outlook.com
 ([fe80::c10d:da7:e50d:3ea7]) by CY4PR1001MB2133.namprd10.prod.outlook.com
 ([fe80::c10d:da7:e50d:3ea7%5]) with mapi id 15.20.4287.038; Mon, 19 Jul 2021
 16:02:15 +0000
Subject: Re: [TECH TOPIC] Rust for Linux
To: Wedson Almeida Filho <wedsonaf@google.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Greg KH <greg@kroah.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
        Viresh Kumar <viresh.kumar@linaro.org>
References: <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Message-ID: <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com>
Date: Mon, 19 Jul 2021 18:02:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YPV7DTFBRN4UFMH1@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::24) To CY4PR1001MB2133.namprd10.prod.outlook.com
 (2603:10b6:910:43::27)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.13] (86.254.109.123) by MR1P264CA0065.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 16:02:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eab5c68c-dde7-4148-f630-08d94ace93be
X-MS-TrafficTypeDiagnostic: CY4PR10MB1880:
X-Microsoft-Antispam-PRVS: 
	<CY4PR10MB18801BC5834BB650A683BECF97E19@CY4PR10MB1880.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5xncyzhb4LQOuF/LstiDhmLGRXZeW/9OuXXd8tvWLlRovfC/Gpg1pr3aiwNzE0+3bzS0gbdSsIpZcnItx/n2umaynRUDoL1NYlf94E6cEb2RwNzbELRkaXtecX+6EnLYNhDYTMHFrVbZhnCPY6/7svs97myIYntC0zMkVHLmt7SlcCzydxX8VMOx9M2lNaC+/vpJgUP2k+ikw/PEvGEFL3lpaBtNmoQD3XqzPuc/kyor4MskKDeiWT9LaKhXWMtgGh9gCssFLSfiqgHrK1SpcmPQt31t5UPy+E4HdVAX5QpYCd+8PIE8Em7g+pW7QkHKgBepBVxCeOzUmLOAa/fX/DmDMtFaSgcD1dglD9VZ+g9aRDFvDVyTn+KJQ0QzlAY+nOBT5ri30rMDuKu9fShCngADTDGlYnAjXw6Nn0+IzqtxUx3iKtccSnstelqOrZYCS1YPrkvnYIO9xWIKNNOnW/2YWOGM9mAcQWlS7eMELFGeWv2OjYN5PCz7nFoEBViiVOM0JRjuTdyFfMOa4TkFmxLfOWx+cejIRROZk7T8XvebyvojqiMI+gZGAHNLErw/ArNaKrJm/hcFMhhwX/vBu3GEVE77fNIURMpMiBEnZLO7LYRN5bzUTxA2mpHcfEbX2DrZldaArkDd9yWPfBxexSDSr4iKFWSSTUd+SInz5Qi74e+0hAoxWkr26PHzyL08gznZqxg8uYf4dXajjXanFtKVJydaAvX+LWI2xL2cYcH3BeAw1prfqz0WvMuHT4Og/R0loBinmCkZE26bgfzFsVdS18rylzuWlm0tD/VG8PDdOV7jPq/ufUlUHXpDNoyVXu6DrDEDLHa0Amcg0gVtlt0XiKBxXnSFgbuJ2NW+ShA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2133.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(39860400002)(366004)(86362001)(478600001)(966005)(7416002)(31696002)(6486002)(54906003)(16576012)(110136005)(316002)(186003)(2906002)(44832011)(8676002)(6666004)(2616005)(66946007)(66476007)(31686004)(8936002)(36756003)(83380400001)(956004)(52116002)(5660300002)(38350700002)(38100700002)(26005)(4326008)(66556008)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?Windows-1252?Q?tfcbIM+nAN+zT03/UTvwSj5ePuZEf9/AB8xB8DqziZSzL+feqXHrNYUh?=
 =?Windows-1252?Q?uWZt4kuUYXUe8sKf3Uc0lIMnAZLHDXnlf+mD/gzcv9WPcuHGPO7WqyHl?=
 =?Windows-1252?Q?98Ts4ApNak/WZThyLmS+y7+gzsmzMUl+PVbif+DfGdIwWr8RIc7TiUnA?=
 =?Windows-1252?Q?qx5q/NYN8r8Hqbo6J9D1eQWuqeJyNBtKqKUr0ahJqpsdehQ8f3KyBEND?=
 =?Windows-1252?Q?XNEC4wF3RIrOrRG97N0VuvouStNXnxyVfVj2wgiXX+go52Oe9DCfle5i?=
 =?Windows-1252?Q?O5NF9i3Migwpbi+lhWASEYdcfiXOAFzUJtUxfysFs/2F5NtV2VeP7Fu5?=
 =?Windows-1252?Q?XF3sRm6Ld2YzzgNy+p7SO596vNSLm56U7iGL98v28YDgPq01n0T/VPg5?=
 =?Windows-1252?Q?wbp4U83gVb1RZE6OVgKih3DQkEGAy0Os08QLPhxHzrpxcXcfqvXNvLWY?=
 =?Windows-1252?Q?gRbjjE1CBQeeKEL179EQ5xo+u24Wv825UbO7/ICNh31wEX03TlHY/SNn?=
 =?Windows-1252?Q?dHENYbtl4G3zWAxRw6sfgp7t+4BxlKltUWAd9kTenBdLth2FCcR8JGO2?=
 =?Windows-1252?Q?3rtiNgphwC9AZbt5h7iVld/G1t6JR0rtGucAs9awncrDDRAsAsLg2dJN?=
 =?Windows-1252?Q?F42DT3kcfMBYdsTfO+VX7d5/qZOeyG50djhHYsbf9yZ6rnYTz/OlmPk8?=
 =?Windows-1252?Q?zc+92XuBlr+CT0GlVk/Ix6HZGfP0bJ4qkqscygjq46f7Bm+OLEg3JNrf?=
 =?Windows-1252?Q?1ZBW71l4ZIAg9Y17lAnhIrGdHgkUrFJPMYlBe7jAamYNQXzgoGyLiZoN?=
 =?Windows-1252?Q?kL+EP86s7VwQTZOtKFvBDEXdT8VklyOlH5LjVA4iJLlM/lV8jnUmZu6v?=
 =?Windows-1252?Q?yUhaholae6XvD76kWJRBEssPfmsx7XzEoJ7tpSTYLBJ9w8HV8sC9/+Hu?=
 =?Windows-1252?Q?Flf6ntv+bKh1GSTNnPKAeawnW7NjgHNLYRWhkm5lLM47jM8yoyHoUOoj?=
 =?Windows-1252?Q?GnXOc/rGF1zrtrbpGew6CW4p5hsYdlpsqUDACjxfg9l/n47HcHK61DAt?=
 =?Windows-1252?Q?+CRRdhLuPNGREKvypd4BB7Q5EGKcL3tt1kJXZ5L3IWny+oYZtwfZiAuO?=
 =?Windows-1252?Q?45zTQDz0McXCEt2PL56CHi1rkm3D3ExFC+sOtI/lGRK+/+MGAVPICbJm?=
 =?Windows-1252?Q?QVNIA/dEgzz/c3fv2NSDWyN8Z8Nc8zdgs1Rcf/iGYWEsB8yMC8S7vC+F?=
 =?Windows-1252?Q?ZBZxIDNqyYAiqbQbeVknHErK5014swTtEc858ZamZ4RtZMw9PtM9mYgx?=
 =?Windows-1252?Q?DaNZh9TtoyuGtdVnJyxFGLfSC0BO4BjQMYoGZwFiy/bqIM43W78nFWSf?=
 =?Windows-1252?Q?vAi4hhaqDqGTOMGG115c4NmfHA4ZLAora/Fsyploy9YsHa2SsjMehiCO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab5c68c-dde7-4148-f630-08d94ace93be
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2133.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 16:02:15.5977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXi2tH3/3rWR+IM1Xv1gRTH7TMBKPfjv1+BTDk+IM8DgiOJDsXyvK1r+Jiw0Ja8siyHjzi91RaS9w82AfK4a5+NicJ+ybG9EwX7pkeWFBxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1880
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190092
X-Proofpoint-ORIG-GUID: t9QSprmvrLFsW_dj7vvY7-lykT7vx0A0
X-Proofpoint-GUID: t9QSprmvrLFsW_dj7vvY7-lykT7vx0A0


On 7/19/21 3:15 PM, Wedson Almeida Filho wrote:
> On Mon, Jul 19, 2021 at 01:24:49PM +0100, Wedson Almeida Filho wrote:
>> On Fri, Jul 09, 2021 at 12:13:25AM +0200, Linus Walleij wrote:
>>> I have seen that QEMU has a piece of code for the Arm PrimeCell
>>> PL061 GPIO block which corresponds to drivers/gpio/gpio-pl061.c
>>> Note that this hardware apart from being used in all Arm reference
>>> designs is used on ARMv4T systems that are not supported by
>>> LLVM but only GCC, which might complicate things.
>>
>> Here is a working PL061 driver in Rust (converted form the C one):
>> https://raw.githubusercontent.com/wedsonaf/linux/pl061/drivers/gpio/gpio_pl061_rust.rs
> 
> I'm also attaching an html rending of the C and Rust versions side by side where
> I try to line the definitions up to make it easier to contrast the two
> implementations.
> 

This is really cool :-) As a Rust noob, I have a few questions:

1. I'm curious about some of the writeb() vs. try_writeb() calls:

fn direction_output(data: &Ref<DeviceData>, offset: u32, value: bool) ->
Result {
        let woffset = bit(offset + 2).into();
        let _guard = data.lock();
        let pl061 = data.resources().ok_or(Error::ENXIO)?;
        pl061.base.try_writeb((value as u8) << offset, woffset)?;
        let mut gpiodir = pl061.base.readb(GPIODIR);
        gpiodir |= bit(offset);
        pl061.base.writeb(gpiodir, GPIODIR);

        // gpio value is set again, because pl061 doesn't allow to set
value of a gpio pin before
        // configuring it in OUT mode.
        pl061.base.try_writeb((value as u8) << offset, woffset)?;
        Ok(())
    }

Here you have try_writeb() (and error return) where there was just a
writeb() without any error handling in the C version. Is this what
Miguel was answering a bit down the thread where the address is computed
((value as u8) << offset) so it _needs_ to use the try_() version?

If offset can be anything but a "correct" value here, should there be a
check for that somewhere else and then the computed value can be
subsequently treated as safe (i.e. there's a second try_writeb() in the
function that now presumably does the runtime check a second time,
redundantly)?

2. In many places you have the C code:

struct pl061 *pl061 = dev_get_drvdata(dev);

with the equivalent Rust code as:

let pl061 = data.resources().ok_or(Error::ENXIO)?;

Why doesn't the C code need to check for errors here? Or put
differently, why can the Rust version fail?

3. In probe() you have:

data.resources().ok_or(Error::ENXIO)?.base.writeb(0, GPIOIE); // disable
irqs
data.registrations()
    .ok_or(Error::ENXIO)?
    .gpio_chip
    .register_with_irq(PL061_GPIO_NR, None, dev, data.clone(), irq)?;

So here, if .register_with_irq() or any of the other ?-marked calls
fail, then the function returns and the local variable "data" and all
its members are freed/deallocated using destructors like in C++ RAII?

Thanks,


Vegard

