Return-Path: <ksummit+bounces-1058-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E56D78644F
	for <lists@lfdr.de>; Thu, 24 Aug 2023 02:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB5BC2813A6
	for <lists@lfdr.de>; Thu, 24 Aug 2023 00:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924FB15C3;
	Thu, 24 Aug 2023 00:47:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3107F
	for <ksummit@lists.linux.dev>; Thu, 24 Aug 2023 00:46:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv5WifTucDl+IcfTgw8eJfBH7Dpc0aSptYyRvtvGwUH8OZZbFtZ3In88JiqFy4jA9meSC+G7xL4prHJT3LkoH4qtH6shi8SttgcFNg6niIv7k7vAPhg1Yw8hMva3KREDgW0P5g8a4nR6RwpQ84WlCp3JHYylcJJW9pvo2zLi7lG1/6tpUgtUr+1xcckHRGDpSNZfVIMO+be13mOn+edbRP3Uo/LKFu9XZyHttreDvJ3uWdb/fzaFyAnOkJV69/mC44q8lci031BpqhYEqw5wEr9j4m6o1jqPVuG5RHRNHVpGF4P3UYEjzfNgliYADj8qg5gBY9jTKGdDmx7otDevpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0EX2/jPaJ2or0/FmcDYxfsWHNuQaSnh29gZRvIEPwE=;
 b=ea4imlcST/7ZTxXW7Ly35vUe9I8u0ANLfJylvVVyJlcPiBaz2ef7Qkoe//oVmifzILR3zPnna0GR1ek7QiVLZReeR1GC636JSq3iXS+2POUujilLyg8PhZaGR87bfzb/RJAT3lJdp0aPwb+eNLXP7SRrL5eP2fNuwnkLsX+DErnsol+drjoaFukTF5A/1RY5QW8BnlBwgEx85BivipXsaATK3hRmmjg+ID6Gus9VjXg3zrfQX1JkQrWihw5bkBjRPiAs83mq4ClGaiR4MWWbYDr6UQXprLsBhoBwkE9wNPzMVQHx29eiKEvergPZpuYv2MmKEpc6qJBewwmarnrLmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0EX2/jPaJ2or0/FmcDYxfsWHNuQaSnh29gZRvIEPwE=;
 b=DJYaar68VARhGBdK+KBvk8AkeZbLC6WNeQHjqUkwEPOt/x8Ewu5lxn+3JHa1DHGg6mA1GPjMNVLgLQ0ioarVwfg+R8DBOJao8uviz9Lw63Wa2Cr5dzLbRi4K3pRlFXVoFZSO8G/zkekIByPIJaqlL7vxaekUXbZxNavPE3r217IhmMbF/bOhX6L+VuKYnlOFO5fk8cduRRbSIQsNqYl3MCwNC1bfmadHtdCPVtisSEVVfJTJrf63yI3yWo5QN8eO90HfMas2upJ73SYK0xizQU0wd6O7/MWeRBuGHqzweFxiLYrnZjmji+DIklpTY7rA4y6Km99HvgIhzb1KjgDcYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA1PR12MB7320.namprd12.prod.outlook.com (2603:10b6:806:2b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Thu, 24 Aug
 2023 00:46:56 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 00:46:56 +0000
Date: Wed, 23 Aug 2023 21:46:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing
 expectations...
Message-ID: <ZOaofrS7/lErEYB5@nvidia.com>
References: <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <2023082250-replace-rectangle-1d47@gregkh>
 <20230822142913.GB14596@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822142913.GB14596@pendragon.ideasonboard.com>
X-ClientProxiedBy: YT4PR01CA0342.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA1PR12MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: 474ce353-db50-4af7-884a-08dba43b9de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ToRdXz2RYIBwgNP0ue5OZUz39Hmoc54GwEpiIRpfWFyNl6OMPWDszvSWixplQHiYOEB6RTQyo89f0XW+hHnCHZoevS3YlQ6R1I4ZiaT1a8KvYV6WjhhfrEPeWFgJ0LZNwsXD/v+uGnq/VXXKi3URCvQyCg5WGV/fmrmtNPXEWy8wjS5C+Zkk9KgvjVyk9GIEkOfHSHSBpyEi/N9JKQlKx6HNHN9gR0vi/BTTLK5tmoVseJkz94ho79Fucx0Jc4O4GGzfJE3sx3oLES5bMkkHgXAjyvfJXwms7zfzLUGcKqz9S4u5qiQaJjrZIgbHSSOomux7IlaSdJ02XB+ALmstMsBq+j3x7Es1GlW9Rw9rYl+njVuJlGAMUufZX2+lN3bJ5csGeE5gAzoTuPsWmFWhRdgG//hixUh5a/xeXRmVAS2zzHFC/wbLD8RmvMTe9kx6uQXrBepoeIUxDlAckOWc9muVlB20lxrSgIWGEcBIga+Val++0n9GBAOwzV99D7h43ImBzovVDtoO8a3ZVuyrfwoOJp2E88v0kgzXWQ0wEhEdcOY7l8WdY0CbZFtxFg6u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(396003)(346002)(1800799009)(186009)(451199024)(2616005)(6486002)(6506007)(6512007)(86362001)(66556008)(5660300002)(4326008)(2906002)(38100700002)(54906003)(8676002)(66946007)(8936002)(66476007)(36756003)(41300700001)(6916009)(316002)(478600001)(83380400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UN2Y6T/gRbon+rvC/1baYmFoba54kpDuAnYoFbvj+KT2LHXe5zGnVLASPmeS?=
 =?us-ascii?Q?11RFu0C4qpmcET36EEL6g/OKxLq7bkcyi6n+Mm+Aa8yS6vGXn0FoUrsoPRBv?=
 =?us-ascii?Q?bycbRefjdrWMkheMuTpwn9vpfKfeTFl1Bv3ku64BJEw+soPjyRBzMS5vwatM?=
 =?us-ascii?Q?H4nKiijGdAPLBx7sx+tUuibNel4hKU1gQQjYm3/wUTsG4lDWiidOtqu+3m33?=
 =?us-ascii?Q?9RsRWlE0oENwZ3ROlrU2o+sO7YRQ0NJI2PNewFU58lsycLgMrEZjVIaocyf1?=
 =?us-ascii?Q?rh53JvAghVbsFQ1UINOfcz9+7i6UWuXqkFat5TIavbDGBN+ax/iWTUBR3+rr?=
 =?us-ascii?Q?PMu2PbRR7Cw15TbTF1kuFFOgIHvpHzVbPSanSjfkKwHGv7U6jpssobhQOk0z?=
 =?us-ascii?Q?w4JHbP5C2s1g5DJPWOgXvv5xNNCLd1vvDyaRNKNt1tUlkld53wll7rWh4ZL7?=
 =?us-ascii?Q?TXIcAXH1z2Bui2R5VoJX3MdYrpTNjUcv1PhrnEZxZ6oCN6EuQnMHws78U0jt?=
 =?us-ascii?Q?BVGBF335lri3tOceMX8c6Gd40oPNFuMLBGI4pPklqGJwnklRQeu4ECBDPaeC?=
 =?us-ascii?Q?LBnlYjlBEpf3obwCdIZYisoz5VkH3eRqaIvMTQLw3wTc8jO5b5Q790zd0PHq?=
 =?us-ascii?Q?kKE0KL2FetBr7uBtedz/KPvFUT4gt6vSoJVsdQKvFpbpbCTC8kFExM7PID2r?=
 =?us-ascii?Q?xMNCdo6Diu8oCVk6sFzok4TWKHIyGWL3x0NLHdm1eaJBSuwEEg99nWxJjoJ5?=
 =?us-ascii?Q?UdoT3iYoyRX4Mw/LNmxeZim9ypmqKupR131W9nTxIaAQFpLCLQnF/ib0h20p?=
 =?us-ascii?Q?xPgVIUkbqr3yAxzS611YKn0Mf5KZUFSAoII1YnKWCeqcaUCWRcJwbtu50HGm?=
 =?us-ascii?Q?cVweEK0BGxARhJrrD/MP/3xvB5A7EjmdAnRPuVOU/AtgrT9PHKUUp+pY1OkA?=
 =?us-ascii?Q?XkS41bjw6Dgm95ERz/MWq2Qd0mf321IHZL0ou7132EcM8a8x3cvoDKunQVUf?=
 =?us-ascii?Q?Je1n3dPfm/7Ln4ozAkwFdtZd2qWFsDMM7XKqoMHHtHFDNSHHPAON6HfNPbc4?=
 =?us-ascii?Q?iyuhe63HZD99iZfgs6G6COmTinHAajuIcOnmKSAWVVDBwdZysecl5lIm3JUn?=
 =?us-ascii?Q?cVkb7IULrBxtN0V8ssneV+z+CoVR6ZBVKK9wLW9uP8uTvJhVvefmzRveTAJP?=
 =?us-ascii?Q?O5VoNqLcjb9joZGq8/1RtZe2DPABw1OlODKgyiAJNM8HIRnOjz1jZPaHTXgF?=
 =?us-ascii?Q?BLDhJBCxqVn5K8tPSH5iErzmZLZZ/6Miz5WSxXLwmJKABbYLI/59s2Z6fSJ5?=
 =?us-ascii?Q?eJSN04N+y785zrfrZVr6G2Ipl0cdyR14cgkT8nFQV8OIPjOHqLD/yVoXQbba?=
 =?us-ascii?Q?qF9DaCAYcdrzAy+ROwbmqh4DxyWFhNbXL5ZHPx2seTSheXKBWSNulHrHRedf?=
 =?us-ascii?Q?NPAqzGp6xs5r4QlL62CkW9AhJN/A1lvg3Sv3UAaggKrfELXCpXhiYsnf0H0s?=
 =?us-ascii?Q?XEX6QCQwXurBNXHy6/zdH5pC0tdaG4rXGT96VNm6X7r9Nm9GOkyiOtnNps47?=
 =?us-ascii?Q?IyWF9Qfj3JjsF+2szOc/dSr0numibmnTmsOyhgA8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474ce353-db50-4af7-884a-08dba43b9de5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 00:46:56.6532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGsS8Cn9xwzYeCZFLbpqiQXShUdqSXUWR2GxcePJdI5oNtVQ7ajHSlBB2AJ6/jmA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7320

On Tue, Aug 22, 2023 at 05:29:13PM +0300, Laurent Pinchart wrote:
> On Tue, Aug 22, 2023 at 10:55:13AM +0200, Greg KH wrote:
> > On Mon, Aug 21, 2023 at 05:43:21PM -0700, Dan Williams wrote:
> > > - When do vendors need to share a common ABI?
> > 
> > When they do the "same type of thing" :)
> > 
> > > - How well is our "community consensus" protocol working to give
> > >   contributors actionable feedback?
> > > - Is there more we can do to enable contributors to steer the right path
> > >   out of the expediency vs maintainability trap?
> > > 
> > > "Confidential Computing" is an example of an area with several
> > > cross-silicon-vendor implementations that continue to add features with
> > > a steady stream of upstream design decisions that cross multiple
> > > subsystems.
> > 
> > And the normal "you all need to get together and agree on an api
> > yourself, otherwise we can't take any of this" should work here, right?
> > 
> > Well, except for the groups that snuck stuff in before we realized what
> > it really was, I guess we are stuck with them.
> > 
> > Why not have the community "fight it out" among themselves first, before
> > we have to worry about it?
> 
> In some (many ?) cases, the lowest effort path is to try and sneak it in
> without us noticing rather than "fighting it out" or "designing it out"
> among themselves. There are cases where this behaviour is even the
> consensus among vendors, as they collectively prefer keeping the design
> effort low and get drivers and whole new subsystems upstream without
> taking the community interests into account at all. 

I've begun to have the opinion that the old incentive structure in the
industry has fallen apart.

It used to be that we had Customers, OEMs, OS vendors, and Chip
builders as separate entities with a strong need to work
together. Community consensus and industry standards was a good way to
make that necessary collaboration work. You could even see a buisness
alignment that participating was good for all sides.

Now we have single entities that are OEM/(Largest) Customer/OS vendor
and sometimes even Chip designer all rolled into one opaque box. They
run, and only care about, a completely proprietary stack in userspace.

Now the business alignment is gone. Replaced by a perspective that the
utility of open source and standards is not to foster collaboration
and grow the industry but to drive down cost.

This is not just a Linux problem, I'm seeing signs of similar stresses
in the standards area as well.

As a vendor, if your biggest customers are not interested in
standards, you are not going to try to make them. As a huge customer
you don't want to make standards because that would only help your
competition. Just enough commonality to lower the cost and grind the
vendors.

So, instead of nice formal standards, we get defacto standards by who
can get stuff merged into Linux. The unfortunate truth is that in many
cases Linux is not well setup to manage the inevitable conflict that
results.

> The drivers/accel/ story is a fairly good example of the conflict
> between vendors who want to disclose as little as possible and ship
> closed-source userpace, and a community that insists on having fully
> open stacks.

We've never had a clear consensus on what userspace threshold exists
for getting something into the kernel.

In practice I think we've made it far too hard to get rid of stuff
that didn't work out for whatever reason. Once you are in, you are in
forever. That puts a lot of pressure on the maintainers to get it
right the first time, whatever "right" means. Also alot of incentive
to get "in" at any cost because once you are "in" you are golden.

For instance, I recently tried to remove some totally dead and
unusable code exposing a uAPI. It clearly was snuck in only to support
some kind of out of tree patchset and proprietary userspace. I got
pushback, and left it alone.

Or if you assert drivers/accel should not have happened, why can't we
delete that directory? Otherwise we've delivered a grandfathered and
permanent competitive advantage to one device.

It is a tough problem.

Jason

