Return-Path: <ksummit+bounces-116-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2BE368646
	for <lists@lfdr.de>; Thu, 22 Apr 2021 19:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id AF1C01C69CA
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8952FA0;
	Thu, 22 Apr 2021 17:58:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3E871
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 17:58:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8C5A6ABF6;
	Thu, 22 Apr 2021 17:58:18 +0000 (UTC)
Date: Thu, 22 Apr 2021 19:58:18 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: Bart Van Assche <bvanassche@acm.org>
cc: Joe Perches <joe@perches.com>, 
    "Martin K. Petersen" <martin.petersen@oracle.com>, 
    James Bottomley <James.Bottomley@HansenPartnership.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
In-Reply-To: <edd8564c-f565-33f8-dd7f-9bf98a421b8b@acm.org>
Message-ID: <nycvar.YFH.7.76.2104221957230.18270@cbobk.fhfr.pm>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <yq1y2dbtbrm.fsf@ca-mkp.ca.oracle.com> <b8827b4267648f35c31628e73be42efee52f5cf5.camel@perches.com> <edd8564c-f565-33f8-dd7f-9bf98a421b8b@acm.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Apr 2021, Bart Van Assche wrote:

> > And I believe James is referring to whitespace style trivial patches.
> 
> Maybe it's just me but I don't like patches that only change whitespace
> or the coding style. I'm fine with such patches if these are part of a
> larger patch series that also fixes bugs but not if such patches are
> posted on their own. "git log -p" and "git blame" are important tools to
> learn more about why code evolved into its current state.
> Whitespace-only patches make it harder to follow how code evolved into
> its current state.

Just to state the (hopefully) obvious -- even on the rare ocasions I am 
actually collecting patches for trivial.git, I am ignoring whitespace-only 
"fixes".

-- 
Jiri Kosina
Director, SUSE Labs Core

