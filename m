Return-Path: <ksummit+bounces-702-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECBD558C05
	for <lists@lfdr.de>; Fri, 24 Jun 2022 01:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9726280C54
	for <lists@lfdr.de>; Thu, 23 Jun 2022 23:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E276B469F;
	Thu, 23 Jun 2022 23:57:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7C34697
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 23:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656028637; x=1687564637;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=oQ3lHSVWiQg9uR7knpuX8Ou60qCvfLCtdY8qC0mt/Dg=;
  b=NS4cnww2Jb529/O+c7TW8XXoi11MTIZ57cjK+IKtYghX9frl4Jw+cKTs
   KCXg+/oFy1NyHEGJjLXr3Srytzq6tmlynJH+4UI/lEOkVeEJsFk721XF0
   mOLO0+X0ITq8ruA5o431VzhDJHys7BvT4Sv9O9VVqVft6Yzrpqnj057rf
   nzDQk/yocQ6/CvdjiNp1eo+kvMrRRKmL44lrvDp5IHsKDEWzdN0U3Cn63
   m9sJaDP8sdSskJfKp9fABJuebQl3NccSM/qrNLoQ2crIwUjV+AbXVJT9S
   C0nc66IEr140IWIecQe9J6fUk6MiS//y/A91mpoavCUDjWEZUqJafpojx
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="280920567"
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="280920567"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 16:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="915437922"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jun 2022 16:57:16 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 16:57:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 23 Jun 2022 16:57:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 23 Jun 2022 16:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIdPbXDJK2xEvUvOlSQ645bUnKyFFnycXqiBRbjhUmdWUJ1cl3uYc3gBfZteU5moRgDgTjmI9e9pKHmQAqKmAwM9ReOOOMfRsq1J+gfiiobPR9hzzDqJ7rXRS/Fo1lE/gjH+96SztwpxBCgriRlVgaqBshH43ZkAKyodvcSH5Pzr498+hmoEpkLrnPRjb9oCY+aududsc3jGcKybXQzMd43l88dJoTLdskY1/aZ5+m1lVh7ouEIV7JM3tTZcfQtibMxPWL5WzrOyfoHB6fR+xieCMZYLYOSaB+VuIff3t/uLWemiiBWxziJZy4UK4Zs1WCcvkG+eia5w7f2hy84cNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=az9bTxiy7iyWayAcnxxoSRvCSGKSjWax5Q6F2SNcNAY=;
 b=mR6bl//jES0OOfBltt1mceuCR4lXFEaShWrMzEC+yMyEbr/3IeTwOSJxZDeJhV8iVANmya9FPzcHULZizboiBDHiIi97LqZNyQcI7gxydp3zEMMbTWA9RcDOhIncf07R16CuC12d92gW8mYxSAHF80U6u9tKGe0gGs2ToL1nyE4EdPGbjGZ4FUbD5Wm8s/oTz2DGC9WN9C2fOCqi+qQga2RB1bBbzWVUVn6YsEB5k5V923ucLh8/vslV1K+JaqbTNLrezkkwNlJroaNxUbNGS9MAzmLtAuSe1ibJnqZ+Wfd3MI0/fepVymxqHPQJq1zfFnkq9hC58TOhlLKvhjHJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by IA1PR11MB6148.namprd11.prod.outlook.com
 (2603:10b6:208:3ec::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 23:57:14 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::f50c:6e72:c8aa:8dbf]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::f50c:6e72:c8aa:8dbf%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 23:57:13 +0000
Date: Thu, 23 Jun 2022 16:57:11 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	<ksummit@lists.linux.dev>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [TECH TOPIC] Driver probe fails and register succeeds
Message-ID: <62b4fdd7c4183_8070294ad@dwillia2-xfh.notmuch>
References: <d39ab7f8-db79-2f0d-9d2c-ecce42505b10@linuxfoundation.org>
 <YrTzmJJEY4bwEBB7@pendragon.ideasonboard.com>
 <a3de118e-1ef8-ac79-cf0c-e5e55a1238c8@linuxfoundation.org>
 <YrT3niddXMfuTWnT@pendragon.ideasonboard.com>
 <6c4867fb-9020-ba64-427b-556e5f004a27@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6c4867fb-9020-ba64-427b-556e5f004a27@linuxfoundation.org>
X-ClientProxiedBy: MWHPR12CA0028.namprd12.prod.outlook.com
 (2603:10b6:301:2::14) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3b9bc94-ed03-48e6-21d3-08da55741813
X-MS-TrafficTypeDiagnostic: IA1PR11MB6148:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQHiEQ5Tb3TfUM6QHxX0WorQO4rEhdP7VzjX6QT3vDPsbCph7q8HHL9M6gJX/9Y6x6IA1Et6OD8HIkoe7cru6AjzhzbRCwMc3JB8JkXy1OwZl84QS3lDVnHOI1e5ZbPZxzn01bAYbLw5D/UP8Whhc5sC0qCHKNWKNc0wpdMgSrjq7egz1WusSWMlFhhXxcmHSs8K/A4eq/ANL3nbNxkAb9sT19BpVhi8AN6C4iQ4xJIgL7P29wpRNtF+yXvIRgvDv0JEhWBURMkJIfq4Fc8cJ0MnOnACXAgWTcolkDQ1GaO6OLbePOWixMZfV5dVm2K4zwZY5IcECuc1EdadoHjp6sYP95e+79a6a9q6TC/8H8EkKYTDQojgmheTLhgg4ZyWn41jgxeOPObkOBgo/FRE1Ca4RV1S3RQ86BuWx7ameh5GF296BnYG8oHI4EPDx3GypB2DM/WNKXwiv/guYVujxPaLDz0aDOOiMjAg2w+ec0e4CWmj8pTVtg7t4mJlxtRvmyscRsnqgzVd6gOTQBBVU024fXD9SloPgvo9wn+N4XEiR7mWp0ulS7KN9wZPQCjX33jGLlF0sCnWnYD6Byg1eULh2Lz1o43MkuPbVoy8WWnAA/nnQb3XsANA2zuP8uz85IWMYjaIb5T3tbj5bX34XJm74UBUkToV3MUbLU5Zdyz5wzS1IaNx9Pc+D1MhPr6xyuoW8kDlOpA+PUlKC2HoKIxeKLwB2mM6EKARmDp3+rxvf6bq4XRpelB3bjwTrH0e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2126.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(366004)(396003)(376002)(136003)(316002)(54906003)(86362001)(4326008)(66946007)(38100700002)(186003)(66476007)(8676002)(66556008)(110136005)(2906002)(41300700001)(478600001)(6506007)(26005)(8936002)(53546011)(83380400001)(5660300002)(9686003)(6512007)(82960400001)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H8pUAwydcJE9Fg7P7r2YzZLFH4uxqDe0tLCBmZpVnC5B5mgcGLk+vFnllqeW?=
 =?us-ascii?Q?K55O8mXNxoMQh3hRXARRfe2dcUsyZ8QPVJWXhC9hYh1pRUHknHQgFnXMPebg?=
 =?us-ascii?Q?cqWxG1xeuGPVW/SYOQxwBzbyFHo6+atTkZCHg1TghNj9y5E4+XtnSRDxehzn?=
 =?us-ascii?Q?TQ+Y5RHJQHRjDZ1BeuXfKQdEb9Zn4JLsb+HT6qiIyu5iKJD/mOGIkK1B/CXm?=
 =?us-ascii?Q?DyaneJrXHsX5aXDIzlcUU11IjWYgS5hU7Rlcn9NetXH6spy0Fe8eS53Quw05?=
 =?us-ascii?Q?o9S0b2HfssG8s7C9uo55Eq4fI7qLPd0VAtFGqamTF9PHOV+TizI8t2cSoRMW?=
 =?us-ascii?Q?M21iSwT9JpbnvfUfuX0EEWjVIWYN5KZbVY60WZctkLZYM3Uckdd/heZXgZtI?=
 =?us-ascii?Q?Zk3g8KQtHbaAtmqXzmOv23quvvKD6AVz7+zE9Hm7jy9+jpBbo5JQbsm5tG4d?=
 =?us-ascii?Q?yg8Mamvzb3n+y+XmbVSTI2ZlpH8upj4PTZhZW/iEFsRVXCDbWhDmF1aIAKIZ?=
 =?us-ascii?Q?L8023A+d5oPfyrJAfIl8MxieYfekLLixdJM9kjCiKV8B70TB4DoJF/2R2A6p?=
 =?us-ascii?Q?NtPu2DXKgdzq0jTKqBSbCdj9rwsTsdzTmr3xrTyz73Iqcw0VhESsRgBstBhh?=
 =?us-ascii?Q?uDi7y4Fv44P16DzOozw2HhgKKTTPfg0kwfQEAogm6A+zJQzl7wIEoRQrDck6?=
 =?us-ascii?Q?/bMdxj4N32En+eA6K9MXfv+DyktJWglYB1ej9oTAFRriENyI5BgtyFAKZZkH?=
 =?us-ascii?Q?STSmBDZig+eIj+XHYIIFy7+j+t/h6PsrQy4YwmoIMa4/TlQLzrSUe5qPQ6wQ?=
 =?us-ascii?Q?qM6pQwiOkXRILVLMvxr5IfFQCQ2pmXd8MXfo/1whgzMVJm6wxwvCw5xTySPn?=
 =?us-ascii?Q?yP/KEx1ZwsulNzRPwHN1W6Mo6EjPJIKrSJZBM3BUQ8B2YoUD0WrQc7QjdBN/?=
 =?us-ascii?Q?JAI0rYXodCnGUGXP17B7tpwDTdIZLDrhtw8Zf/tyOtc7mOVGFJnYhnCovMh5?=
 =?us-ascii?Q?+pG3CygNQYHmwZV1/Kb6tlxDAzXwMo/k72ZmLvl7H5lEMY/9v2+gmF/n5M0q?=
 =?us-ascii?Q?WwEMgtDaky+ECzdAuPIzZagsm4Bu9RYlhAHQ+gQ8u+uBAHfNBhxj3umxI5vh?=
 =?us-ascii?Q?UhEUEEB9dUO3xxsJFhgEiPtwQhi9Y2SeUHIjnwbVNNc4hQDgx6CD0DbqDkkb?=
 =?us-ascii?Q?+9Wnnrr0n7RH8RGMNZC+8tcNfPZ3L950AY6nqwmjZA7E9+DmxyuUbOD0ywG2?=
 =?us-ascii?Q?XIRWeZAz+zmiM73MEwHVROU58SY4PVispp/U6HWmmuDF7prspU+ebSl6Ddha?=
 =?us-ascii?Q?pQaUY2Z0I9ZL6Wmplf0JS5FgaKkJA5Q1io+W5U2/chJq/5kRkujMqkwAOPQx?=
 =?us-ascii?Q?dcyr/UkUuu66lzYlhGY7ZclNmhAkLRpF0o4t8jKS5lznsA2tmpQ1CpPn5+Sk?=
 =?us-ascii?Q?RC3kBqd9TH9SO11gs5WPEzGlhBF1Hmoh7i09QijGdmK3xel31PZzAPZdVpHf?=
 =?us-ascii?Q?qluWV+eAph6B7I2ghxy3bwhbZMf0K8pnRJzUmPDVTFA5tSKy7/UMo8Rjile2?=
 =?us-ascii?Q?e7/wwIH5t9OAXbRwWxCw1h5Ke3rGwVPzYdajxf0aN95U+8o8z3boRMSz8XMG?=
 =?us-ascii?Q?lskRvAlYfiZnb+14X4PqAX6CnEq2PjVArIA5hlMQkqHsv05EW7H1HePCC0hj?=
 =?us-ascii?Q?9z7Z5+98tZAHJFtEwx4QUIKktoSMiHjAPD8y7BLYTSv30ZHivH6qnMfHPtgw?=
 =?us-ascii?Q?ey53wqyrTwRttwXwJi5PVMwLagSgWIA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b9bc94-ed03-48e6-21d3-08da55741813
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 23:57:13.6226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNxQrX0sMwARNpE+77VQ8n+MhMJIVOGPlJ4fZ2ZbPBK5bKwq8s9tA1JTe1OxwCtJ0hq6W2ovV6UAWQ+0KJY7kdZxntPjB22WoLmhNdLy7Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
X-OriginatorOrg: intel.com

Shuah Khan wrote:
> On 6/23/22 5:30 PM, Laurent Pinchart wrote:
> > Hi Shuah,
> > 
> > On Thu, Jun 23, 2022 at 05:28:09PM -0600, Shuah Khan wrote:
> >> On 6/23/22 5:13 PM, Laurent Pinchart wrote:
> >>> On Thu, Jun 23, 2022 at 05:05:30PM -0600, Shuah Khan wrote:
> >>>> I have been debugging a driver probe failure and noticed that driver gets
> >>>> registered even when driver probe fails. This is not a new behavior. The
> >>>> code in question is the same since 2005.
> >>>>
> >>>> dmesg will say that a driver probe failed with error code and then the very
> >>>> next message from interface core that says driver is registered successfully.
> >>>> It will create sysfs interfaces.
> >>>>
> >>>> The probe failure is propagated from the drive probe routine all the way up to
> >>>> __driver_attach(). __driver_attach() ignores the error and and returns success.
> >>>>
> >>>>            __device_driver_lock(dev, dev->parent);
> >>>>            driver_probe_device(drv, dev);
> >>>>            __device_driver_unlock(dev, dev->parent);
> >>>>
> >>>>            return 0;
> >>>>
> >>>> Interface driver register goes on to create sysfs entries as if driver probe
> >>>> worked. It handles errors from driver_register() and unwinds the register
> >>>> properly, however in this case it doesn't know about the failure.
> >>>>
> >>>> At this point the driver is defunct with sysfs interfaces. User has to run
> >>>> rmmod to get rid of the defunct driver.
> >>>>
> >>>> Simply returning the error from __driver_attach() didn't work as expected.
> >>>> I figured it would fail since not all interface drivers can handle errors
> >>>> from driver probe routines.
> >>>>
> >>>> I propose that we discuss the scenario to find possible solutions to avoid
> >>>> defunct drivers.
> >>>
> >>> This seems to be the expected behaviour to me. The probe failure doesn't
> >>> necessarily indicate that the driver is at fault, it means that
> >>> something went wrong when associating a particular device with the
> >>> driver. It could be that the device is faulty for instance, and that
> >>> shouldn't prevent the driver from being registered, especially if
> >>> multiple instances of the device can be present in the system, as that
> >>> would then prevent any of those instances from working due to one faulty
> >>> device.
> >>
> >> Agreed. This behavior works well in the cases of hardware/device failures
> >> that cause probe failure. The case I am seeing is a driver bug that causes
> >> probe failure.
> > 
> > Is there a way for the kernel to determine that the probe failure was
> > caused by a buggy driver and not a faulty device ?
> > 
> 
> That has to be explored.
> 
> >>> What other behaviour would you expect ?
> >>
> >> I am looking to see if we can propagate the error to the interface driver to
> >> handle instead of leaving the defunct driver. This isn't an easy problem to
> >> solve though. As you mentioned driver probe could fail if device is bad
> >> and we want the driver to handle the others.
> >>
> >> The fact is we will end up with defunct drivers in some cases. If user notices
> >> the error they could go clean it up. My main concern is the sysfs interfaces
> >> hanging around. The desired behavior would be not leaving defunct drivers with
> >> associated sysfs files.
> > 
> > I don't think the driver is "defunct". It has been loaded successfully,
> > and it's fully operational, just not bound to any device.
> > 
> 
> Not in the case I am debugging. It won't be successfully bound any device.
> That is what I meant by defunct. Maybe there is a better word to use.
> 
> The driver releases all resources in its probe failure path.

If the driver is bad there is no way for the kernel to know.

Are you perhaps looking for a technique to unload the driver if another
driver knows that it is indeed ok to unload the driver if it does not
attach to its intended device?

You mention the interface driver getting involved. The interface driver
could do something like:

    device_add(dev);
    device_lock(dev);
    if (!dev->driver)
        driver_unregister(drv);
    device_unlock(dev);

...but that would need to know that nothing else needs @drv and that
@drv has been registered and ->probe() run synchronous with
device_add(). That does not work with the async and deferred probing
options.

