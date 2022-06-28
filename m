Return-Path: <ksummit+bounces-735-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3555C069
	for <lists@lfdr.de>; Tue, 28 Jun 2022 12:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F845280CD1
	for <lists@lfdr.de>; Tue, 28 Jun 2022 10:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AD12585;
	Tue, 28 Jun 2022 10:53:25 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584A5257A
	for <ksummit@lists.linux.dev>; Tue, 28 Jun 2022 10:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05E0C341CA;
	Tue, 28 Jun 2022 10:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656413604;
	bh=grdLRzAj6PRa0BcEmotDwSMJfsLbi3L1BBDFXLYMrBI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ecCBIvz7wRETcOutlLbSle+hI9Coh3mC8kpqqHq0Z2izkZBAHbyyz3b7kMWmgWCjM
	 mWDQwYcsVUj3m4R8uxFvsPFyfm3RPRKIleI1XJFYF62PDt7/icOcAkzzfFoLfgZDYJ
	 VTnbY6/cs6U/s2oC1MxjlqFXcfOmIBUhnp8w6SB/EcnGhEvfXRXYja8x4AqFocVPub
	 /tS1qsDTW106ANi2zRgiHuTvupTaI7ku8nGG2m0P56oRMx7Gzlmg4Hrm6/yInAo4qr
	 QDXLiZwjzp2YyU0tX1Rb0z2CnyWaoH56Qxgz1e2iJh4Xp/qVOpcgoNaWMtSy8XH7jA
	 PPl4JbOvqRgRQ==
Date: Tue, 28 Jun 2022 11:53:17 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Howlett <liam.howlett@oracle.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Jani
 Nikula <jani.nikula@intel.com>, ksummit
 <ksummit-discuss@lists.linuxfoundation.org>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>, Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220628115317.2ed84432@sal.lan>
In-Reply-To: <YrnabzwutRGIooCS@sirena.org.uk>
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
	<YrnabzwutRGIooCS@sirena.org.uk>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 27 Jun 2022 17:27:27 +0100
Mark Brown <broonie@kernel.org> escreveu:

> On Mon, Jun 27, 2022 at 03:28:40PM +0000, Liam Howlett wrote:
> > * Mauro Carvalho Chehab <mchehab@kernel.org> [220626 05:53]:  
> 
> > > Btw, once we fix the errors from the above checks, one of the things that 
> > > could be done in order to avoid noisy doc builds would be to run this 
> > > during normal Kernel build, if CONFIG_WERROR is set (and if .git is present
> > > at the source build dir):  
> 
> > > 	./scripts/documentation-file-ref-check --warn

Sent a patch series addressing those at linux-next:
	https://lore.kernel.org/linux-doc/cover.1656234456.git.mchehab@kernel.org/T/#t

> > > 	./scripts/get_abi.pl validate

I submited a patch fixing one such issue:
	https://lore.kernel.org/all/1e92337c1ef74f5eb9e1c1871e20b858b490d269.1656235926.git.mchehab@kernel.org/ 

and Jonathan Cameron submitted a series addressing those:

	https://lore.kernel.org/linux-iio/20220626165511.602202-1-jic23@kernel.org/T/#t 

> > > 	./scripts/kernel-doc --none $(git grep kernel-doc $(git ls-files Documentation/|grep -v kernel-doc.rst)|perl -ne 'print "$1\n" if (m/kernel-doc::\s*(\S+)/);'|sort|uniq)   

Sent a patch series addressing all of those, also against linux-next:

	https://lore.kernel.org/linux-doc/cover.1656409369.git.mchehab@kernel.org/T/#t

next-20220627 has currently:
	32 cross broken docs cross reference warnings;
	 4 duplicated ABI symbols;
	60 kernel-doc warnings.

After having those three series applied, the 3 above commands would
produce just 3 warnings:

	Warning: Documentation/dev-tools/kunit/run_wrapper.rst references a file that doesn't exist: Documentation/dev-tools/kunit/non_uml.rst
	Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
	Warning: drivers/acpi/device_pm.c references a file that doesn't exist: Documentation/firmware-guide/acpi/low-power-probe.rst

Those 3 warnings depend on non-merged documents.

After those ~100 warnings that can be quickly checked with the 3 above
command lines in a couple of seconds, there are the Sphinx errors.
Reducing the build time (currently at 10 mins order) to something more
palatable could help having more people checking them before submitting
patches and waiting for 0day results.

> That last one is quite the command line...

True. Yet, placing it at docs/Makefile for the "make all" target should be 
trivial and will hopefully make more Kernel developers to check for some of 
the documentation issues. 

The other two are already called, depending on some config vars:

	# Check for broken documentation file references
	ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
	$(shell $(srctree)/scripts/documentation-file-ref-check --warn)
	endif

	# Check for broken ABI files
	ifeq ($(CONFIG_WARN_ABI_ERRORS),y)
	$(shell $(srctree)/scripts/get_abi.pl validate --dir $(srctree)/Documentation/ABI)
	endif

But they don't currently stop the build if CONFIG_WERROR is enabled.


> 
> > > aborting the build on such warnings.  
> 
> > > On my notebook (i5-10210U), the above takes ~8 seconds to run. So, it 
> > > won't make much difference at the build time, and doing that would have
> > > avoided ~100 warnings during htmldocs build against current linux-next.  
> 
> > Couldn't we add this to the build bots and ask the authors to fix the
> > commits?  
> 
> There's reports for at least some of this for -next already, at least
> for newly introduced warnings.  If we could get 0day or something else
> that picks stuff off the lists that would help a lot I think, as would
> getting it into the bots that people who like to fix up warnings tend to
> be using.

Yes, newly-introduced warnings are monitored there, but still patches
adding new warnings keep being merged, requiring extra periodic janitorial
work in order to reduce the build noise that would otherwise increase
with time.

Regards,
Mauro

