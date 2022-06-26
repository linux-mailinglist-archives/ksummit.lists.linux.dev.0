Return-Path: <ksummit+bounces-722-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8855B005
	for <lists@lfdr.de>; Sun, 26 Jun 2022 09:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 6DA022E0C8A
	for <lists@lfdr.de>; Sun, 26 Jun 2022 07:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F413B17F6;
	Sun, 26 Jun 2022 07:55:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9272A17EC
	for <ksummit@lists.linux.dev>; Sun, 26 Jun 2022 07:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB62CC34114;
	Sun, 26 Jun 2022 07:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656230131;
	bh=o7WlYPEZO/oFaPpzAOLT7WbMaNEyRGPFSeGK18ME60g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hxhG/FONfNUa6fAUZtgpjUummNug6smmnNaoJWBqNLDNWXvxfSbl0RT/JNDntH5bx
	 CIvGM1JxM2y7tYGOCzVn/vIn75tYTbTdGVKkXkemv2NFR6/EanFKZVnQqB7blKsTgB
	 cNvNICWHpgR+JXAR1hPzZ8I4e++AUGY0Aqgq/emk6Dn4KHzA/56kfEJs8SztwmXnd3
	 NV5FFqYoOfmOTLXWv4KHXk8vF+uxZ4FLY2NBQiCNE0mcww/pXIpv+PF+LxtUosWFtE
	 N431ExjclqHLPlD6JDIBoiieWWDKXizyYYT6dORZMEpcZ2hhFj7wnYIbni89DMN+Rq
	 J6iHrpFgyKczQ==
Date: Sun, 26 Jun 2022 08:55:24 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 ksummit@lists.linux.dev, Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220626085524.42ee92c0@sal.lan>
In-Reply-To: <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
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
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 25 Jun 2022 11:11:40 -0700
Linus Torvalds <torvalds@linux-foundation.org> escreveu:

> On Sat, Jun 25, 2022 at 7:00 AM Jonathan Corbet <corbet@lwn.net> wrote:
> >
> > I said "some" - this was a proof-of-concept hack.  The complexity of
> > their symbol lookup code is ... daunting ... and not something that gets
> > fixed in one place.  More research is required...  
> 
> Note that at least for me, the issue with building docs isn't hugely
> performance related.
> 
> Yes, yes, it would be good if it was faster. But..
> 
> The primary problems I see with building the docs (and thus checking
> them, the same way I do an allmodconfig build test) is
> 
>  (a) it's insanely noisy, which makes and "check that it's ok" ENTIRELY USELESS.

When the environment is set for building docs, almost all output there
are actually due to build errors/warnings that got introduced by patches
touching documentation that were never build-tested.

There are 4 components that report errors during "make htmldocs". 

1. Documentation cross-reference check. 

	$ scripts/documentation-file-ref-check --warn
	Warning: Documentation/admin-guide/kernel-parameters.txt references a file that doesn't exist: Documentation/virt/kvm/amd-memory-encryption.rst
	Warning: Documentation/dev-tools/kunit/run_wrapper.rst references a file that doesn't exist: Documentation/dev-tools/kunit/non_uml.rst
	...

Those warnings are result of build-untested patches moving/renaming/removing 
documentation without updating all documentation.

On almost all Kernel versions, I usually send a couple of patch series
addressing them, but incomplete patches that forget about updating references
keep being merged.

Without htmldocs build tests by patch authors, this is an endless job.

2. ABI documentation check:

	$ ./scripts/get_abi.pl validate
	Warning: /sys/bus/iio/devices/iio:deviceX/fault_ovuv is defined 2 times:  Documentation/ABI/testing/sysfs-bus-iio-temperature-max31865:0  Documentation/ABI/testing/sysfs-bus-iio-temperature-max31856:14
	Warning: /sys/bus/iio/devices/iio:deviceX/in_filter_notch_center_frequency is defined 2 times:  Documentation/ABI/testing/sysfs-bus-iio:1948  Documentation/ABI/testing/sysfs-bus-iio-temperature-max31865:12
	Warning: /sys/bus/iio/devices/triggerX/sampling_frequency is defined 2 times:  Documentation/ABI/testing/sysfs-bus-iio:96  Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:92
	Warning: /sys/devices/system/cpu/cpuX/topology/core_id is defined 2 times:  Documentation/ABI/stable/sysfs-devices-system-cpu:38  Documentation/ABI/testing/sysfs-devices-system-cpu:69

Those warnings indicate problems with userspace API definitions, as the 
same symbol has different meanings.

Talking about ABI, the output is even worse if the script is used to check
if the ABIs used on a running system are all documented or not. On my
laptop (Kernel 5.18.5-200.fc36.x86_64), I'm getting, for instance, 2815
undocumented or badly-specified sysfs ABI symbols: 

	$ sudo ./scripts/get_abi.pl undefined >errors
	Reading /sys directory contents...done.
	Converting ABI What fields into regexes...done.
	4:59: processing sysfs files... done
	$ wc -l errors
	2815

3. kernel-doc warnings.

Those indicate kernel-doc markups with troubles. The output is the same
as running:

	$ ./scripts/kernel-doc --none ./include/linux/fscache.h
	./include/linux/fscache.h:269: warning: Function parameter or member 'cookie' not described in 'fscache_use_cookie'
	./include/linux/fscache.h:269: warning: Excess function parameter 'object' description in 'fscache_use_cookie'
	./include/linux/fscache.h:286: warning: Function parameter or member 'cookie' not described in 'fscache_unuse_cookie'
	./include/linux/fscache.h:286: warning: Excess function parameter 'object' description in 'fscache_unuse_cookie'

In this particular case, kernel-doc markup describes a non-existent "object"
symbol, while the function prototype has "cookie". Probably result of some
rename at the function prototype that was not validated via html build.

4. Sphinx warnings.

Most of them are one line warnings:

	Documentation/arm/samsung-s3c24xx/cpufreq.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
	Documentation/admin-guide/device-mapper/writecache.rst:23: WARNING: Unexpected indentation.
	Documentation/vm/highmem:166: ./include/linux/highmem.h:154: WARNING: Inline emphasis start-string without end-string.
	Documentation/vm/highmem:166: ./include/linux/highmem.h:157: WARNING: Inline emphasis start-string without end-string.

But on errors, Sphinx is very noisy, as it outputs the offending
lines or tables. 

For instance, on next-20220620, some patch broke a table.
The error there is very noisy, as it outputs the entire broken table.

> Seriously. There's a very solid reason why I require the standard
> kernel build to be entirely warning-free. Warnings are *BAD*. Even a
> single false-positive warning invalidates all other warnings.

All the Sphinx warnings could be avoided if people start testing
documentation changes. A policy of making kernel htmldocs warning-free
would have solved all the above issues.

I can submit some patches addressing issues along this week against
linux-next (or against your tree?), but without developers trying to
build documentation, we'll keep having issues.

> And the doc build isn't about some "single warning" thing.
> 
>  (b) it requires some unusual build tools
> 
> Now, (b) may some historical oddity, but at least if you have Fedora
> installed and it still has sphinx version 2.2.11 or something like
> that.
>
> And when you try to build docs, the makefile gives you some random pip
> install thing that is entirely bogus.

That's likely the case. You probably installed Sphinx via pip
on, let's say, Fedora 35. After upgrading to Fedora 36, python version
got incremented, and the past install won't work anymore, because it
would be trying to use patch libraries from a different directory. 

Since this changeset:

	a8b380c379ef ("scripts: sphinx-pre-install: only ask to activate valid venvs")

the documentation build checks if this command works:

	sphinx-build --version

If it doesn't, it will give instructions about how to install Sphinx.

> The proper fix is to actually remove that old sphinx environment
> entirely, and install "python3-sphinx" instead, but that's not at all
> what the "to upgrade Sphinx" docs in the kernel say when you try to
> make the docs.

The script which checks for Sphinx availability is capable of either
recommend distro-specific Sphinx package or the usage of python venv.

As Sphinx release cycle is fast, it was opted to use venv by default,
so, it currently recommends the usage of pip. 

The same script called at htmldocs build time can be used to recommend
the usage of the distro-provided package. Running it in Fedora, it would
give:

	./scripts/sphinx-pre-install --no-virtualenv
	Detected OS: Fedora release 36 (Thirty Six).
	ERROR: please install "python-sphinx", otherwise, build won't work.
	Warning: better to also install "sphinx_rtd_theme".
	Warning: better to also install "texlive-ctex".
	You should run:

		sudo dnf install -y python3-sphinx python3-sphinx_rtd_theme texlive-ctex
	note: If you want pdf, you need at least Sphinx 2.4.4.

	Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 955.

It would be trivial to change the default to recommend the usage of the
distro package. Yet:

1. Newer versions of Sphinx are two times slower than 2.4.x;

2. Recommending the same version everywhere ensures that the
   documentation will be compatible with Sphinx >= 2.4.

3. Older LTS distros may not have a Sphinx version compatible with the
   Kernel.

> Anyway, (b) is one of those "the docs about the docs are wrong" things
> and ironic - but easily fixable if you know about it.
> 
> But (a) then makes it all entirely pointless as far as I'm concerned.
> The doc build could take five seconds, and I *still* wouldn't bother,
> because building docs doesn't actually do anything useful for me. It's
> just noise.


The hope is that, if building it would be fast enough, developers and
maintainers would actually check if the build succeeds without warnings,
as ultimately, the big noise is due to patches merged without being
even build-tested.

Regards,
Mauro


