Return-Path: <ksummit+bounces-730-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A31C55BAE4
	for <lists@lfdr.de>; Mon, 27 Jun 2022 17:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 5350A2E0C85
	for <lists@lfdr.de>; Mon, 27 Jun 2022 15:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B8E33F5;
	Mon, 27 Jun 2022 15:54:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2805833E4
	for <ksummit@lists.linux.dev>; Mon, 27 Jun 2022 15:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD9EC3411D;
	Mon, 27 Jun 2022 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656345297;
	bh=DGDin6E1OcuborryauCqoeoU+IZY6xunj/ocHyhG6p0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sXFOTy6z7/alcfU+mGD2B1b3Ho00n+1D5CummE3tns01X27h/RwLT1wUthsJKJsti
	 VAxVNt3lXm31qeLOvJG0PMpdekUaYt4zukLM2rbctFyvkhB2/cTpZIHs7rF95Rfkj1
	 CUJ2SXjxKUHGFhHMcr597psMHFc4i4uspJjCEAVz+1WKOCBvWnGEfHthfRqULw2ag/
	 GRvHx+LF/6g2q8vup1AijIgnIIDopUr+7Ir5FIUfXr7XOUnf6doQZ+MjHPmhSK4VT2
	 TIZXTU5vYuyU3Hz7rKz7+hsEqhMg3ITazuToqUrPoKh1ZC8nyJbvWrQ0QyQoQfHUUo
	 tBhqOaTk4OKwg==
Date: Mon, 27 Jun 2022 17:54:52 +0200
From: Christian Brauner <brauner@kernel.org>
To: Liam Howlett <liam.howlett@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jani Nikula <jani.nikula@intel.com>,
	ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
Message-ID: <20220627155452.uwxnpbjh3z4efzif@wittgenstein>
References: <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net>
 <20220624083307.159824bd@sal.lan>
 <87tu891xfv.fsf@meer.lwn.net>
 <20220625101029.67f14c4c@sal.lan>
 <87czew267z.fsf@meer.lwn.net>
 <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
 <20220626085524.42ee92c0@sal.lan>
 <20220626105306.122cdeda@sal.lan>
 <20220627152832.yigreu5ztnoxfp4g@revolver>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220627152832.yigreu5ztnoxfp4g@revolver>

On Mon, Jun 27, 2022 at 03:28:40PM +0000, Liam Howlett wrote:
> * Mauro Carvalho Chehab <mchehab@kernel.org> [220626 05:53]:
> > Em Sun, 26 Jun 2022 08:55:24 +0100
> > Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> > 
> > > Em Sat, 25 Jun 2022 11:11:40 -0700
> > > Linus Torvalds <torvalds@linux-foundation.org> escreveu:
> > > 
> > > > On Sat, Jun 25, 2022 at 7:00 AM Jonathan Corbet <corbet@lwn.net> wrote:  
> > > > >
> > > > > I said "some" - this was a proof-of-concept hack.  The complexity of
> > > > > their symbol lookup code is ... daunting ... and not something that gets
> > > > > fixed in one place.  More research is required...    
> > > > 
> > > > Note that at least for me, the issue with building docs isn't hugely
> > > > performance related.
> > > > 
> > > > Yes, yes, it would be good if it was faster. But..
> > > > 
> > > > The primary problems I see with building the docs (and thus checking
> > > > them, the same way I do an allmodconfig build test) is
> > > > 
> > > >  (a) it's insanely noisy, which makes and "check that it's ok" ENTIRELY USELESS.  
> > > 
> > > When the environment is set for building docs, almost all output there
> > > are actually due to build errors/warnings that got introduced by patches
> > > touching documentation that were never build-tested.
> > > 
> > > There are 4 components that report errors during "make htmldocs". 
> > > 
> > > 1. Documentation cross-reference check. 
> > ...
> > > 2. ABI documentation check:
> > ...
> > > 3. kernel-doc warnings.
> > ...
> > 
> > Btw, once we fix the errors from the above checks, one of the things that 
> > could be done in order to avoid noisy doc builds would be to run this 
> > during normal Kernel build, if CONFIG_WERROR is set (and if .git is present
> > at the source build dir):
> > 
> > 	./scripts/documentation-file-ref-check --warn
> > 	./scripts/get_abi.pl validate
> > 	./scripts/kernel-doc --none $(git grep kernel-doc $(git ls-files Documentation/|grep -v kernel-doc.rst)|perl -ne 'print "$1\n" if (m/kernel-doc::\s*(\S+)/);'|sort|uniq) 
> > 
> > aborting the build on such warnings.
> > 
> > On my notebook (i5-10210U), the above takes ~8 seconds to run. So, it 
> > won't make much difference at the build time, and doing that would have
> > avoided ~100 warnings during htmldocs build against current linux-next.
> > 
> 
> Couldn't we add this to the build bots and ask the authors to fix the
> commits?

Isn't for-next already integrated? Maybe not. I got a mail from Andrew
telling me I had a kernel-doc copy-paste error.

Integration with build-bots would be great. I generally aim to add
kernel-doc for all non-trivial code that I add. But during different
patchset versions copy-paste errors do sometimes happen (e.g., for git
grep/sed calls).

