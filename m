Return-Path: <ksummit+bounces-723-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B30355B0CB
	for <lists@lfdr.de>; Sun, 26 Jun 2022 11:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E434E280CB9
	for <lists@lfdr.de>; Sun, 26 Jun 2022 09:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2708623D2;
	Sun, 26 Jun 2022 09:26:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED81B17F7
	for <ksummit@lists.linux.dev>; Sun, 26 Jun 2022 09:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A39C34114;
	Sun, 26 Jun 2022 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656235605;
	bh=T3PaHX0gedCwecebrqOzi5OJrSNmKPhCu5Hun+fcpUg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s8mjojHJONUDg4fYc9N05v3fI8Re1GMZ4y1x9aGplVLUoqfjtRntqxHKsm8aO4Rqv
	 /hEb1s8UjBQ0BOGDn4R5HMMzTkNpOwDaaB2yyBcVTHrjH8Dt7srYUAVhtYlGp9GrJZ
	 /rlfSbbO72PvpOx0bmo1p4AKDVG+eZ2HnohYbwrk0j3C6mNW6x+lZrAM5JEbhqrhR+
	 /ijMD/EmPH55k9RrdbppMPtlzIrbG8i1ImUgyZ6dQTQE4Y1DwqyOC8RJH4J/MvSrU8
	 ke5jt3az7WPoyrvfRpe10W0NIcwrLrjgYnbVz+ctWxuzhh6QDi6ugRRqI0vJFNBPRl
	 h+1Mar6n+LUlg==
Date: Sun, 26 Jun 2022 10:26:39 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 ksummit@lists.linux.dev, Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220626102639.15e69f7d@sal.lan>
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
> 
> 	$ scripts/documentation-file-ref-check --warn
> 	Warning: Documentation/admin-guide/kernel-parameters.txt references a file that doesn't exist: Documentation/virt/kvm/amd-memory-encryption.rst
> 	Warning: Documentation/dev-tools/kunit/run_wrapper.rst references a file that doesn't exist: Documentation/dev-tools/kunit/non_uml.rst
> 	...
> 
> Those warnings are result of build-untested patches moving/renaming/removing 
> documentation without updating all documentation.
> 
> On almost all Kernel versions, I usually send a couple of patch series
> addressing them, but incomplete patches that forget about updating references
> keep being merged.
> 
> Without htmldocs build tests by patch authors, this is an endless job.

Just sent a patch series addressing the existing issues against
next-20220624:

	https://lore.kernel.org/linux-doc/cover.1656234456.git.mchehab@kernel.org/T/#t

With that, the number of warnings will be reduced to only 3:

	$ ./scripts/documentation-file-ref-check 
	Documentation/dev-tools/kunit/run_wrapper.rst: Documentation/dev-tools/kunit/non_uml.rst
	Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
	drivers/acpi/device_pm.c: Documentation/firmware-guide/acpi/low-power-probe.rst

Those are actually useful for doc discussions, as they show one of
the issues we're currently having.

Sometimes, support for some functionality crosses multiple subsystems.
On such cases, part of the support may end being merged on a future
linux-next version - or even on a future Kernel version.

That seems to be the case of sm5703 support. The regulator bindings got
already merged, but the mfd ones weren't.

So, there's not much that could be done to fix
siliconmitus,sm5703-regulator.yaml broken reference to
mfd/siliconmitus,sm5703.yaml.

The same seems to apply to low-power-probe.rst: the patch adding
it was not merged yet at linux-next:

	https://lore.kernel.org/all/20210128232729.16064-3-sakari.ailus@linux.intel.com/

but the patch using it at drivers/acpi/device_pm.c was merged.

Regards,
Mauro

