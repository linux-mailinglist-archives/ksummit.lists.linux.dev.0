Return-Path: <ksummit+bounces-2298-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500FB425FE
	for <lists@lfdr.de>; Wed,  3 Sep 2025 17:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3743616AAEF
	for <lists@lfdr.de>; Wed,  3 Sep 2025 15:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF6628A1E6;
	Wed,  3 Sep 2025 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQAy7nl7"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9255021D3F6;
	Wed,  3 Sep 2025 15:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756914753; cv=none; b=P9qlG0eszmtLoTEwCq65xsDQ29/7u3jtpr7c9rbMl/qxCq0Lzm1c0CxSqhtaCZgCi7FQOHt84xovgAqC9+Kyclzf3oM515MUBCQjh2oB61zVF+T9UJn83LxKWRtOZ6ONUv+IGr80st7NgBMd5I0xQXXEVX6DKpdh25GREPOlPG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756914753; c=relaxed/simple;
	bh=Dia7i4SZs/QHOK4dY0wnSKRQydjPdYaJVl6UENAVyZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUyW98wO0ugh4rc3CjDcjasnnh8xwW1Ku637QaGjskI+acPejxU7HgFLTDEy/nA+DAR8G8SrmqH+FD9X30wNdJgObzt9jP69GXbkk8bxW4W2mNe4Bax8B94BW+5CHLvEJEyD/OQxzMee0NNErYEJyoUjowEfRopTQZCMAMe4M7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQAy7nl7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFF8C4CEE7;
	Wed,  3 Sep 2025 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756914753;
	bh=Dia7i4SZs/QHOK4dY0wnSKRQydjPdYaJVl6UENAVyZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQAy7nl7UPIDgDCCdMAEJyRYR6KwrHSgWVgfMqpjjmZ8w+H9+pxBzbZ14puy2esCf
	 to0YkawgplwmOjd4GSYQiO8a2P9o9bhbUBZlKameNv9vYm+vkkaQWQoqxC2rIzpCSd
	 LHe2XIyJsY0j4WSjo2EMeSZn1dYfifBvj4OzRG5vBI6/quOfnQnJz+GJejIjrQahsf
	 rDaZyjMendTMo5DPAGbLEN8x2VGqldkyDIWA4/6ww+1/tkwAPw5CSWn0rioyirXC1X
	 NRgYzXKS5rHngYYEzXDnpkVOf2mNwAkxHmNNHH0FQ5LPUduQ++hsITY9KetDvwjqVr
	 YgOIpzMgywQCA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1utpmh-00000007NmB-00LH;
	Wed, 03 Sep 2025 17:52:31 +0200
Date: Wed, 3 Sep 2025 17:52:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, 
	Linux Documentation <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <5t23xw2yizkyfuevubkvi2keshpi7ut5txftx5tdgeqres24nf@dlewpyk746sw>
References: <20250902191929.504977bf@foz.lan>
 <87frd4vfys.fsf@trenco.lwn.net>
 <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
 <20250903124229.332dfeae@foz.lan>
 <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
 <a88f4cad41b2b0930f2cd486dc6c2ffc64300fa6.camel@sipsolutions.net>
 <xxlm3ozmpel5iadhtambkzfx273oysjraffcizdmgexzhuqtwf@qxkwdvqmbadw>
 <874a85f2154d6b05635d856dcdd85d4715d19d3c.camel@sipsolutions.net>
 <vu3l5df4iz4rbwinxldr56vzupzxeupemcvxt7ziqi7kwhytso@wrgznki67cew>
 <875xdzzgvz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xdzzgvz.fsf@trenco.lwn.net>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Wed, Sep 03, 2025 at 09:37:36AM -0600, Jonathan Corbet wrote:
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > On Wed, Sep 03, 2025 at 05:11:12PM +0200, Johannes Berg wrote:
> >> On Wed, 2025-09-03 at 16:57 +0200, Mauro Carvalho Chehab wrote:
> >> > There are actually 3 different issues that depend on python version:
> >> > 
> >> > 1. sphinx-pre-install:
> >> > 
> >> >     This used to be a Perl script. The goal is to check if sphinx-build
> >> >     is installed and works, and identify missing dependencies.
> >> > 
> >> >     The problem is: if one installs python3xx-Sphinx, instead of
> >> >     python3-Sphinx, the script will fail, except if it first switches
> >> >     to python3.xx;
> >> 
> >> So let it fail. Fail is fine, at least it's a clear signal. The python3-
> >> Spinx package will anyway be a sort of meta-package that's basically
> >> empty and depends on a specific version.
> >
> > No, that's not the case. On Leap, python3-Sphinx uses python 3.6 and has
> > Sphinx version 2.3.x, which is too old.
> 
> That's Leap 15, presumably?

Yes. Leap 15.6 (the latest one)

> Given that 16 is due Real Soon Now, perhaps
> before any kernel with these changes is released, do we need to concern
> ourselves with that?

Not sure how it works on openSUSE, but on other LTS distros, people
usually wait at least for x.1 version (16.1) before migrating their
systems.

> > True, but at least one of the major LTS distros don't have it(*).
> >
> > We can review it after Leap is replaced for the next openSUSE release.
> >
> > (*) also, RHEL8 (and its derivated releases) suffer the same issues
> >      and they aren't EOL yet.
> >
> > For most of us, I doubt the fallback logic would ever be used.
> 
> CentOS 8 stream went EOL over a year ago.  How many people have systems
> stuck on RHEL 8 and are using them to do docs builds?
> 
> > When it becomes painful, we can drop it.
> >
> > Anyway, I'll let it for Jon to decide.
> 
> I still really don't think that adding that stuff is a good idea; our
> scripts should behave the way people expect them to and not go rooting
> around for alternative interpreters to feed themselves to.  I appreciate
> that you want to make things Just Work for people, that is a great goal,
> but this seems a step too far.

Ok, as I said, it is up to you to decide. I sent already a patch
series with the last patch making the build break with python 3.6:

    https://lore.kernel.org/linux-doc/cover.1756913837.git.mchehab+huawei@kernel.org/

Patches 1 and 2 should be OK to be merged. Patch 3 is the one that
will break for Leap15/RHEL8 and other distros where python 3.6 is
required for the distro default (and typically mandatory) python3
package.

Feel free to apply it or not as you wish.

Thanks,
Mauro

