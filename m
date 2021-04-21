Return-Path: <ksummit+bounces-13-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAF63673A0
	for <lists@lfdr.de>; Wed, 21 Apr 2021 21:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B1D531C1843
	for <lists@lfdr.de>; Wed, 21 Apr 2021 19:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3C12FA0;
	Wed, 21 Apr 2021 19:43:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2612F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 19:43:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B6400B1C8;
	Wed, 21 Apr 2021 19:30:12 +0000 (UTC)
Date: Wed, 21 Apr 2021 21:30:12 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
In-Reply-To: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
Message-ID: <nycvar.YFH.7.76.2104212125330.18270@cbobk.fhfr.pm>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Apr 2021, James Bottomley wrote:

> I've long been on record as not really being a fan of trivial patches
> because they can cause merge issues with current patches and introduce
> bugs, particularly in older drivers, that don't get detected for a long
> while.  However, the recent events with the University of Minnesota:
> 
> https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> 
> Have elevated the risk factor around trivial patches claiming to fix
> bugs to the point where it looks like there's no such thing as a truly
> trivial patch and they all need reviewing.

I am all for discussing policy of trivial patches (*), but just to make it 
clear -- I don't think that's really directly related to the University of 
Minnesota issue.

Most of the patches they sent were not really falling into the "trivial" 
category at all -- they were actual substantial functional changes. As 
such, big part of them would never meet the 'trivial' criteria as defined 
in Documentation/process/submitting-patches.rst

Thanks,

-- 
Jiri Kosina
SUSE Labs

