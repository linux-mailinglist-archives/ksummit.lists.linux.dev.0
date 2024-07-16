Return-Path: <ksummit+bounces-1439-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 263649329BB
	for <lists@lfdr.de>; Tue, 16 Jul 2024 16:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC4B1280F3A
	for <lists@lfdr.de>; Tue, 16 Jul 2024 14:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF57E197A72;
	Tue, 16 Jul 2024 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dW/anO1Z"
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E82A1AA
	for <ksummit@lists.linux.dev>; Tue, 16 Jul 2024 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721141490; cv=fail; b=OObrpsNThaMBQYd0DWN/hf91QqJQFKgtgIGkjy/kb8ov300zZGEbzcnAchvClj2BAcpzmRfbBFFprlhXK6H4ci1p+ZxyrjSiQMWFSyW/lGer2J6wLXjzt28Rzvz4yEG6ZJfLzzVp84kflREfKK7xeQQ5VJN4GUsGQ/6gBGwD3D0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721141490; c=relaxed/simple;
	bh=cVwXOkrpQA+YD6pdTDm4dstxpzBBoyrPQdtUonm/E+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JoLaHF1IWc0cVj2Uv7iGlEdtdkFfsAcs6eg3YzsWaJcF2eUCcgY0UT+wC2W7iz/19oRu6LnUlyRrhO3Fv0dcw6Bo2ycbN9vvp1HkEvcGpIX+GhMrdal/OkzCphd+rsPWern1qiLmH9FDtT1817D7SSlvjpO9eyn0lxNm4Upanvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dW/anO1Z; arc=fail smtp.client-ip=40.107.93.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUiqdHAwAfO+rGeL7+D3st3Xj6obPrr9tXLulLxWokoiH6udtWN7jkBUB7WRaNlHqMdyEdlqrTcDNyv51PW9fN3UJo8uk0vTRbY0nRNDQovh7TF7K/ucpO/alGHMtMsGReC8K57/eFv2LsW1wnHJjfl7sW0AG/SoZ1LpGgsWzfvOeybVmVw8DXZh7jJY5MA5dgnKfkDynkDgVaUs/wH5j0Mu5hPtnEOwJ0r3T3t8cCxecnmfvU4J15WH8WkeVpexZgJ30wMiW9xznEhprKtMe7JZV9TvYNsDRKkKYoZiJ7covdpi879dx8ss98aY55zrBKTSQ7ZEGGVfzQ0O1iNjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zavAjrFaFu07x0nN/9cYwC/pqaX+EfZCQN3A/rMv4CE=;
 b=gfUDEQSlFGpWl0AjgGBGMXT6KR3L6gID4jblIc6uD5LPKsDYbYHcDINe64+icdc0qMGihVcXdRlP7rMnjAq/FKTQmBQB0WNOomqCq2NY+pQZd9yCEIfZiv6K8efCNRzu6ZqyEsKULj9P7GEgvZRX7WCdCE0tSsIQYlL9e3YFYwXD8obIlHzGIDClY8xX+Lmoh5miXxl13TbE5S8M+KZYSC+9QtGjBex1jwgGDFpUyGPPaWuJy9zAE/uun7CLbqMvUrwCG771igq9m0Mz2SJOt/wc+yYBualtLtvLGKZB8Tc/J9SYsV8DtreS/ySdCJPFG7/310X5Ncqqtf10Tkn3mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zavAjrFaFu07x0nN/9cYwC/pqaX+EfZCQN3A/rMv4CE=;
 b=dW/anO1ZphYgpzr7IkDExPjz9mRk/GtyuZIsIjncybitOLDcAUkbKCTUQ4/waic7u5tre2Gl9A8g0hEomhzJIi5PL4TMHSecsuDJfg5H9+x5KuwVOxpizRyAmscsikg3XVvramWMZPExSn4LjdPsmjHujuKyE+r+gS7fJIZe1H0PuQ8c7aS4PRI1cPczGFfCmzlXbDsGGCbWmim5J4nHgxyC8wNZNomKjtBiRaRrveshUFfvL8VxgKQ7wIahrjVXb5ANTaDxlESCfVoiiCouKR6TFdhxZMjtMz+qmG3d+Xa0avsiUTAKoYXDcUeLxPCgdqN3SK2CEBpxF1Ql1GoK+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by PH8PR12MB6963.namprd12.prod.outlook.com (2603:10b6:510:1be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Tue, 16 Jul
 2024 14:51:24 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 14:51:24 +0000
Date: Tue, 16 Jul 2024 11:51:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <20240716145123.GA2254116@nvidia.com>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
 <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
X-ClientProxiedBy: BLAPR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:208:329::6) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|PH8PR12MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 83275c56-1a4c-4c26-af24-08dca5a6c34a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|3613699012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zngd+rNWxx7eTq/Dqpkw9NLz/YTANE+SdQo9BNzswuS4Mp9vtU5+cRlotZqB?=
 =?us-ascii?Q?nioAe6wAY/bIcfOg87c6kw3i7tIKkNcJG5Uv3JQxE/QFdI/+jI6ubqVprEkg?=
 =?us-ascii?Q?h2jwtbDwYb9kS0Zhuv73LPQFTfnxXb/tn89uMlARyDFiusFakH/0PVVV9obk?=
 =?us-ascii?Q?vuBb9W/XadTqLdgUS8U/M91gvWHU3BMkZ9eHWhtFctBEi/8OetDU9X1kdSBR?=
 =?us-ascii?Q?TrMR4p1He50uNL3G2l3D8VqzQ5Fh+uFpXN6OMWtWOgzE+bfB6vV7ESrrjyFQ?=
 =?us-ascii?Q?HOmV08UnQto6cNxvqntZHFWBgGMjVoL185adEphDLUd7mV2yQRtBRi+MpUQN?=
 =?us-ascii?Q?EJF8pIADo/U/rZHde1c2OYm1xEX0vD75HeUzlvV9qJN9q4v7BRmGs+DobbFP?=
 =?us-ascii?Q?DCl2KVv5gnCnDq5puechipZgjnhFVVpu0s34fbnJGpANdvr8FGNl8rzlpEcW?=
 =?us-ascii?Q?5F/EqKdLLf9M+Xic5Jwyi+KlqewjwS4bAoFqj3gY5Jl/PS+mwfp+G6sVZP/C?=
 =?us-ascii?Q?AAhK9YuVVbnneDkv+er5LcVBsOY3Yx8DMuNrSVLvIATmz7MJ0uVyNoMCc+Zk?=
 =?us-ascii?Q?9jS+9+R05gB/8CV4mz0YLCHPvhiCs+hXW3RVlLFekVnphM9pWFfCfhjZCHnz?=
 =?us-ascii?Q?6WnUBN0heFqRJnwxg46fjVGCqqRtFWGZgSJ9ZbGPU12PAh/D0oQ7/6szPnYv?=
 =?us-ascii?Q?YAe/MXAEXahQMQIf3fgJipw2Vb2RiB+dhO6YTQu/0Qarw0R2HVraZ3OcSMif?=
 =?us-ascii?Q?vP/ta6Wkt3ChoU/RQLodVdsqqeh2hRfgJp3VYTuc0dKyncNnAvWUutRJ98gt?=
 =?us-ascii?Q?y1xNCieahBHtDLSRCFDWkuxtRpO2UBmCSShUIza2vtQffAZomQQ2BJ9gK70E?=
 =?us-ascii?Q?23UKPpIuve/rxo7/Oe5kQobbkIf024S7oLK1Mn7KKLSntLHLTK0ckPSNucej?=
 =?us-ascii?Q?NryC15WxWM+wir3jdNsNjZ39b0fZvpuMiKpugxO4Q1kQqFAsW6stjoFXv8aR?=
 =?us-ascii?Q?+5KtvvwNBqC6ycInVPuf3T2nlQKaTZTSUmhvSzq/PjF3bxhMSf1lAesVIV6n?=
 =?us-ascii?Q?eg1W77dRk9nVEeX8V1QH2P+oIeS7tGpsWFQlDl9XccJqwlC9uDWwSM8R/wCc?=
 =?us-ascii?Q?o5XE8a5874g+9Btvn8ch3Szk9z+u2s9ksXUOCNOCuK5DBAdOiUvjgzBxDOfT?=
 =?us-ascii?Q?faRbmW4/mcnebiIf0cKaqUYt4oTxUJMb4uAxvhpZxeVY5bxhBhjFER5Io9yX?=
 =?us-ascii?Q?RGd1S/I8PJhH9TTJy9mo9PyuSUFF9TTxg54tYybAFiHtD5cfhUdvVs8anNcI?=
 =?us-ascii?Q?qzn9INOY4+kRPvxmo0b9cM1D+/Hj4XOxu250fYROYdhLeu/rPjfGW5I+xQqC?=
 =?us-ascii?Q?SwVH8UXx7vZQPVNXoQgstGuI1tO1kD1KRYxvl40hLSHSWLwRPg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+sp4cfafANevcljRZIGQVa0P2OZzSoQbTgDpczxk56QA+XlXL/vWOEGobscY?=
 =?us-ascii?Q?NeG9V2BkB6rfTGzIaWqcbF5SHCovLIsZyat14jSJ+PTRJ1zYbXdC4eTmCvBX?=
 =?us-ascii?Q?ZnIc3/5s6wkrI/W0ZIo0w/f8DBJgIDO9P2Fl/FgSUF7MePV8D4fmkSta38FW?=
 =?us-ascii?Q?3DGX5pb8+gAVHbOG8Wqf6ZKP7P3wXlZ8YPCtstV5TeNdjQQirGHGPZZjSe+s?=
 =?us-ascii?Q?Wx/FNKtxp8gM50friihiwSB9wv7Ouj7WKRlbmcIpfg2z4+puy9b10Zd47b0I?=
 =?us-ascii?Q?dvP9y22x6sgmu1syzuIQoWqxznY75ESRlNeCipME46pffPJklWyi0nIyX/ri?=
 =?us-ascii?Q?Zlpz0igwl6PRGy0dwxMW8V/ONF2ctLsOok9jYiA9j0IqA8fBN/2BjtGkAWc5?=
 =?us-ascii?Q?VDS/8umFQGQrrwrpBhgKOi0hyX9Y+ReFNvLO1Lr4Z8Q2dnD8xLXdny1X8Bmt?=
 =?us-ascii?Q?cL+2l/SK9NaVLClMe+6WOhqBvpNourldvoQjoIzLvwzzqYsGtsIOtAl0sNjK?=
 =?us-ascii?Q?KYAaBIYH5zuT5bPmV6VsjxvgsALB1W2dsWYNThXA+WYZ2Mq5e6u4oRC2bz93?=
 =?us-ascii?Q?RjoU/6l1nNYXkObYyUxBDF3j4BI44MKdAop9kQFU+a0EkzUZuuqLBVqCV0Zh?=
 =?us-ascii?Q?ptmVAc4cLj33fj8Bs3jHy4yR/fRw9aAM6UiSP7xtAP2tmyRPgACMgJut72/K?=
 =?us-ascii?Q?a6k0o/JyaafpwjG8NhQxtUMYrUH5V7+SvNDsp8E6QjMhLoPhAVXHFZ4K8B2D?=
 =?us-ascii?Q?g8o8ju3xhrPAGuZ28LIW+tiAPgnxnJNLizcUUDdGVcGm3fO6US+0StH1sNWv?=
 =?us-ascii?Q?FT+LNaxCfDstRjkr+kgSXLzh6ItBQttGVPRs/VM7kRmROBJ1yQOVS+hcnNYG?=
 =?us-ascii?Q?XCdvjDeWvPnwThs0pGxtAgIQbSaPDGxOLPsB2yK81DPtXLlGnLICRo8c13JD?=
 =?us-ascii?Q?IVbbRo67H2EdYgVb235Qo5fdw+9yEeLjpht1zUrrnggwCynYxAUDoKE2xktQ?=
 =?us-ascii?Q?hTCcKp7Fsg1ALsZlzI1CDiqR7sDV+aNA1Gvl2Jdh6/QB0TFne2X+j6qfU2kp?=
 =?us-ascii?Q?DrVTldX26SOf1RTbZhUzOpNo3k6XP7NkUwTztuY2mDlF1Q3IV55QZt70sRsF?=
 =?us-ascii?Q?fkkOs4mJwkSaS3I3xYOH1xMJWZjKNJMqaMcID5OOAd1NgafR4THnzlWwyejf?=
 =?us-ascii?Q?iy5KziBeLm9jftQSOHJwaIWFPahz2wBqfSkzDNMf9zhMBEbs8Mw+P05ri0ON?=
 =?us-ascii?Q?vAxBFqosvUV9AHyhWjQslHcCoJY6y2eMUPWmnEo6GB9hf/UPuLzTOr6mK/5I?=
 =?us-ascii?Q?FtTMgelChSieOf4MPHH0MVSt8x43UQj+nR4nXrwURONjIWWI2/iYq7GyRodt?=
 =?us-ascii?Q?uN/tIN7/iKhQMtZUu9qT9th9DjH20tYjVAk+HuANMCjtFNz4BTkwOlLItCYu?=
 =?us-ascii?Q?xsp1GNds77Jr1JGiTFPhVGpSKYjtScMKh+0M8qiSl+GmuxdkFO1vafu7WqQV?=
 =?us-ascii?Q?3nlh9EmxYVGMti3GjBRB0upKGwAWeRxAmEoteVf8OJuyYy2JPWVm5EWaNVVO?=
 =?us-ascii?Q?BGvCGCwD2N5EtmgzdlJzOxeVbamW1avjddtL5R6A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83275c56-1a4c-4c26-af24-08dca5a6c34a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 14:51:24.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHAVtX+qwYXpwACgo2PYjrbvte5BBvQgrkGFAOZyE0nYf3JgBWR4G3wjWrwDVQJG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6963

On Sun, Jul 14, 2024 at 03:20:48PM -0400, James Bottomley wrote:

> Here you seem to be assuming that every commit with a Fixes tag for a
> prior release should be in stable ... I don't think that's true at all.

I think that is the main issue here. Having talked to enough people in
the server/enterprise space there are a lot of different ideas about
what should be backported into the various kernel forks out there.

Just looking at the patch meta data there is a spectrum of:
   No-Fixes -> Fixes -> Fixes&Stable

As I maintainer I don't really have a stake in backporter's policies. I
feel like the best I can do is try hard to mark things with Fixes tags
and provide quality commit messages. I know the various forks will
make decisions based on that.

IMHO the cc stable is a nice way to provide an additional opinion that
the patch was thought to be critical when it was merged. People
running forks should really examine those patches closely.

Jason

