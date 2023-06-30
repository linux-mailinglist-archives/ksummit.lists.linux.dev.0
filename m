Return-Path: <ksummit+bounces-942-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4FF743C7B
	for <lists@lfdr.de>; Fri, 30 Jun 2023 15:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 895C91C20C09
	for <lists@lfdr.de>; Fri, 30 Jun 2023 13:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2C9154B4;
	Fri, 30 Jun 2023 13:17:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E43154A4
	for <ksummit@lists.linux.dev>; Fri, 30 Jun 2023 13:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688131061; x=1719667061;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=HPbNMgKImi+3i436d1+zMPvRvWOR+y+EdiQQjMUz4Jc=;
  b=RxkeH16WECNoDXn9i2B0xzglmXNVLDm1oHb1bJlGbSSpi8DgSxb+6Ji+
   f3qT2dtd9atHZfjO5XIJz3tQr8enbxlgQEdyYGuN9phn1a7ESnYMkFTGh
   IwKlId8qo/uzOyzO0IT5JEUpBVsiZiYowjsLhM9xpcD3z4uwAUwd5MyDO
   nVjaXmtMIJ8bbslz0qOQYVm4w6dqcTxPNw3yyh8AXDAIbFxLk6HwzyhOO
   bqf/+OGjfcCicYMdJ8nrjWn97d10KQPBsRqmBjR4WpSy+ri0OLoPGmBbS
   ErsQWkdMRzvDstqZotFas+/k4hhlNdWI40ywQl7bzvzR7Ww7XNgPNNJHp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="362432998"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="362432998"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 06:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="667945355"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="667945355"
Received: from lpascal-mobl.amr.corp.intel.com (HELO localhost) ([10.252.49.62])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 06:17:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: Intersphinx ([TECH TOPIC] Kernel documentation)
In-Reply-To: <87y1k2kl5a.fsf@meer.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87fs6rxppz.fsf@meer.lwn.net> <871qi6glzl.fsf@intel.com>
 <87y1k2kl5a.fsf@meer.lwn.net>
Date: Fri, 30 Jun 2023 16:17:36 +0300
Message-ID: <877crl2iof.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 29 Jun 2023, Jonathan Corbet <corbet@lwn.net> wrote:
> There is a catch, though: In order to be able to create the cross
> references, intersphinx has to be able to read the "objects.inv" file
> for every other document it refers to.  That file, of course, is created
> by building the docs.  In practice this means that, to generate a
> complete set of manuals from a clean repository, it would be necessary
> to do *two* complete builds - one to create the inventory files, and one
> to use them.
>
> That is not exactly the path to a faster build experience.

Right. I was thinking the inventory would be more stable than that, and
you'd somewhat limit the cross-referencing across the boundaries.

It still could be faster, assuming a) non-linear build time increase by
project size, and b) not everything needs to be rebuilt from scratch the
second round. That said, it's a bunch of work to even try. Bummer.

Thanks for looking into it, though.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

