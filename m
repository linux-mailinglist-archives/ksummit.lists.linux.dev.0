Return-Path: <ksummit+bounces-724-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ECE55B0F0
	for <lists@lfdr.de>; Sun, 26 Jun 2022 11:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65F2D280CB9
	for <lists@lfdr.de>; Sun, 26 Jun 2022 09:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3564D290C;
	Sun, 26 Jun 2022 09:53:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1240D17FE
	for <ksummit@lists.linux.dev>; Sun, 26 Jun 2022 09:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14FDC34114;
	Sun, 26 Jun 2022 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656237192;
	bh=EPgTQTV8y/H8bFkT5PT94qO+oxj7hF0ARreIROlYVvs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bPvIMiat0zP/uYb2HXhRFVZWSE7wIG02v5pBbLds1JoSAG9EA3sCNwclkxC3Nw12f
	 6Cyw8e2STwvN14HqHCOKdqIXdc5wCLgIK77shtmI4USUFnxfZgh9KsJCe2ynnZN67/
	 Lnt0E8JqWSgnhQ1jDB13rx2I0jy9UV87PHBnME00wznXODOgCstaof9c6x/iYFlOQH
	 1doikRJD39zqE72udzDZ3HkgND8nPYlhZG2xJnjL2BoQf7uSrVin7adGhFy6/V7T4z
	 Km9+serin6Xjw4oYoUSWIRLwr6wtF9x1HfXV6OIrh7GqvqKZIAzCynwP5/3I+ee8+v
	 bImZu8XWCYMJA==
Date: Sun, 26 Jun 2022 10:53:06 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 ksummit@lists.linux.dev, Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220626105306.122cdeda@sal.lan>
In-Reply-To: <20220626085524.42ee92c0@sal.lan>
References: <87sfo3nh3t.fsf@meer.lwn.net>
	<20220618092447.5ebed314@sal.lan>
	<875ykrrb45.fsf@intel.com>
	<20220623105747.079ac92b@sal.lan>
	<87a6a38plu.fsf@meer.lwn.net>
	<20220624083307.159824bd@sal.lan>
	<87tu891xfv.fsf@meer.lwn.net>
	<20220625101029.67f14c4c@sal.lan>
	<87czew267z.fsf@meer.lwn.net>
	<CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
	<20220626085524.42ee92c0@sal.lan>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 26 Jun 2022 08:55:24 +0100
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Sat, 25 Jun 2022 11:11:40 -0700
> Linus Torvalds <torvalds@linux-foundation.org> escreveu:
> 
> > On Sat, Jun 25, 2022 at 7:00 AM Jonathan Corbet <corbet@lwn.net> wrote:  
> > >
> > > I said "some" - this was a proof-of-concept hack.  The complexity of
> > > their symbol lookup code is ... daunting ... and not something that gets
> > > fixed in one place.  More research is required...    
> > 
> > Note that at least for me, the issue with building docs isn't hugely
> > performance related.
> > 
> > Yes, yes, it would be good if it was faster. But..
> > 
> > The primary problems I see with building the docs (and thus checking
> > them, the same way I do an allmodconfig build test) is
> > 
> >  (a) it's insanely noisy, which makes and "check that it's ok" ENTIRELY USELESS.  
> 
> When the environment is set for building docs, almost all output there
> are actually due to build errors/warnings that got introduced by patches
> touching documentation that were never build-tested.
> 
> There are 4 components that report errors during "make htmldocs". 
> 
> 1. Documentation cross-reference check. 
...
> 2. ABI documentation check:
...
> 3. kernel-doc warnings.
...

Btw, once we fix the errors from the above checks, one of the things that 
could be done in order to avoid noisy doc builds would be to run this 
during normal Kernel build, if CONFIG_WERROR is set (and if .git is present
at the source build dir):

	./scripts/documentation-file-ref-check --warn
	./scripts/get_abi.pl validate
	./scripts/kernel-doc --none $(git grep kernel-doc $(git ls-files Documentation/|grep -v kernel-doc.rst)|perl -ne 'print "$1\n" if (m/kernel-doc::\s*(\S+)/);'|sort|uniq) 

aborting the build on such warnings.

On my notebook (i5-10210U), the above takes ~8 seconds to run. So, it 
won't make much difference at the build time, and doing that would have
avoided ~100 warnings during htmldocs build against current linux-next.

Regards,
Mauro

