Return-Path: <ksummit+bounces-21-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9FB367483
	for <lists@lfdr.de>; Wed, 21 Apr 2021 23:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B5DAF1C2225
	for <lists@lfdr.de>; Wed, 21 Apr 2021 21:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50B02FA1;
	Wed, 21 Apr 2021 21:03:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973A229CA
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 21:03:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C8C0EB005;
	Wed, 21 Apr 2021 21:03:09 +0000 (UTC)
Date: Wed, 21 Apr 2021 23:03:09 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: Julia Lawall <julia.lawall@inria.fr>
cc: Steven Rostedt <rostedt@goodmis.org>, 
    Stephen Hemminger <stephen@networkplumber.org>, 
    Roland Dreier <roland@kernel.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
In-Reply-To: <alpine.DEB.2.22.394.2104212249590.20674@hadrien>
Message-ID: <nycvar.YFH.7.76.2104212258250.18270@cbobk.fhfr.pm>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210421152209.68075314@gandalf.local.home> <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com> <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
 <20210421132824.13a70f6c@hermes.local> <alpine.DEB.2.22.394.2104212233450.20674@hadrien> <20210421164519.4aa271b9@gandalf.local.home> <alpine.DEB.2.22.394.2104212249590.20674@hadrien>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Apr 2021, Julia Lawall wrote:

> > > The apology states that they didn't detect any vulnerabilities.  They
> > > found three non exploitable bugs and submitted incorrect patches for them.
> > > When the patches received some positive feedback, they explained that the
> > > patches were incorrect and provided a proper fix.
> > >
> > > So they damaged trust, but not actually the Linux kernel...
> >
> > That's what they stated, but did any patch that they knew was incorrect
> > actually make it into the kernel? If so, then it's on them.
> 
> No idea.  The apology goes to great lengths to say that none did, but who
> knows.

There are at least two commmits referenced in the LKML thread 
(pci_slot_release() wild dereference and missed unlock in set_fan_div()) 
where new security/stability issue was introduced by the patches.

Of course, under normal circumstances, noone would ever be publicly 
grilled about introducing such an issue in a bugfix by mistake, but this 
is a special case.

-- 
Jiri Kosina
SUSE Labs

