Return-Path: <ksummit+bounces-566-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1172F40B166
	for <lists@lfdr.de>; Tue, 14 Sep 2021 16:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 3448E1C0D66
	for <lists@lfdr.de>; Tue, 14 Sep 2021 14:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549283FD6;
	Tue, 14 Sep 2021 14:40:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB1B3FD0
	for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 14:40:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="283013011"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="283013011"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 07:40:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="544106987"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost) ([10.251.216.6])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 07:40:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Josh Triplett <josh@joshtriplett.org>, Jonathan Corbet <corbet@lwn.net>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
In-Reply-To: <YTvPAMT9FRCUeWjR@localhost>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <877dfop2lx.fsf@meer.lwn.net> <YTvPAMT9FRCUeWjR@localhost>
Date: Tue, 14 Sep 2021 17:40:01 +0300
Message-ID: <878rzz2pby.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 10 Sep 2021, Josh Triplett <josh@joshtriplett.org> wrote:
> On Fri, Sep 10, 2021 at 03:00:58PM -0600, Jonathan Corbet wrote:
>>  - What constitutes an acceptable user-space implementation in cases
>>    where these restrictions apply?
>
> This seems like it'll always be a fuzzy line. The main issue: it's OK if
> there are both open and proprietary users, but it's not OK if the only
> open implementation is an outdated or token project that nobody actually
> uses, that exists and is maintained solely for the purposes of placating
> the kernel requirement. There's no easy way to define that line, other
> than "we'll know it when we see it".

One aspect of it should be easy enough: If you have an issue with your
proprietary stack, but you can't reproduce it with the open stack, you
won't get your fix in the kernel.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

