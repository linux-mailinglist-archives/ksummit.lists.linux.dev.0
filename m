Return-Path: <ksummit+bounces-2297-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D01B425A8
	for <lists@lfdr.de>; Wed,  3 Sep 2025 17:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 666965619AE
	for <lists@lfdr.de>; Wed,  3 Sep 2025 15:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E29274658;
	Wed,  3 Sep 2025 15:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nwaf6BGO"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547F927464F
	for <ksummit@lists.linux.dev>; Wed,  3 Sep 2025 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756913860; cv=none; b=Ukz2L263Tv/WsmkOvb+YwQkcHrtNFJ6H6mzsLdntfcPLO5+TcndQoRcau0Cgxt1at6LxwyzdCbwulU+bcaoFUng+luEgG+KITsATpmmQYFhx7AqZVO6J+LjsS2DD4uPbFGowCeaNSAqyPY0QzYUGDlhFGgiTNNQ5Vu0rdfqfOZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756913860; c=relaxed/simple;
	bh=USI51ege+2yYVyvZ+Tw4ysWpq3aef6ScqscMKEVh/bw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eyKwWZYu3Q+TJe1REGrHANrRZD0JMbtEAW1y9Mx7UlkCUPalw5ufcJ+EH82IxQpbCDl0tpw6O4rGZqMFnpUpQOX5DvGZAwKfZYNo4hq7RZZCUK40vA9uvoC16LgwJJj3qCPecWsywPEgkdqjWpE5vgDcWikXTfcjmygaLZtgfwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nwaf6BGO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4306440AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756913857; bh=YUjaglkD37DauUH4OwZb6DowB+XuOmTJzu0L3rDH6F0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nwaf6BGOcyK9CVhFxYaRftKja9GsvlKxC6OGo2lMkoipSznI7oOoBEvDaHFldvXZn
	 UzwoZqov0mDmjC866rb19HEb7EMyJzZKxuXfnf8cANnlAjKXhACq7AT+4l2mEfHXmi
	 soflxQtFaYj6uGj75OmLsgCQcNM17ivvC52H6byhQGooKlaLVFzJ7dpHQFitj9Mmy3
	 NswjIPGnvPmhCO54gqnAoB448wmHQ2sDaofyw6KTTV+O7b0kxUSYhccggHUnTiZPk1
	 3ScIv6i0sQwlFOwX2HCzbw8Xm8ABMaL9Vt15OIfaYtw97V171sLJUUYQqxtiFplKP8
	 +SPyA9kJH1fQA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4306440AD8;
	Wed,  3 Sep 2025 15:37:37 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Johannes Berg
 <johannes@sipsolutions.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <vu3l5df4iz4rbwinxldr56vzupzxeupemcvxt7ziqi7kwhytso@wrgznki67cew>
References: <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net> <20250902191929.504977bf@foz.lan>
 <87frd4vfys.fsf@trenco.lwn.net>
 <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
 <20250903124229.332dfeae@foz.lan>
 <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
 <a88f4cad41b2b0930f2cd486dc6c2ffc64300fa6.camel@sipsolutions.net>
 <xxlm3ozmpel5iadhtambkzfx273oysjraffcizdmgexzhuqtwf@qxkwdvqmbadw>
 <874a85f2154d6b05635d856dcdd85d4715d19d3c.camel@sipsolutions.net>
 <vu3l5df4iz4rbwinxldr56vzupzxeupemcvxt7ziqi7kwhytso@wrgznki67cew>
Date: Wed, 03 Sep 2025 09:37:36 -0600
Message-ID: <875xdzzgvz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> On Wed, Sep 03, 2025 at 05:11:12PM +0200, Johannes Berg wrote:
>> On Wed, 2025-09-03 at 16:57 +0200, Mauro Carvalho Chehab wrote:
>> > There are actually 3 different issues that depend on python version:
>> > 
>> > 1. sphinx-pre-install:
>> > 
>> >     This used to be a Perl script. The goal is to check if sphinx-build
>> >     is installed and works, and identify missing dependencies.
>> > 
>> >     The problem is: if one installs python3xx-Sphinx, instead of
>> >     python3-Sphinx, the script will fail, except if it first switches
>> >     to python3.xx;
>> 
>> So let it fail. Fail is fine, at least it's a clear signal. The python3-
>> Spinx package will anyway be a sort of meta-package that's basically
>> empty and depends on a specific version.
>
> No, that's not the case. On Leap, python3-Sphinx uses python 3.6 and has
> Sphinx version 2.3.x, which is too old.

That's Leap 15, presumably?  Given that 16 is due Real Soon Now, perhaps
before any kernel with these changes is released, do we need to concern
ourselves with that?

> True, but at least one of the major LTS distros don't have it(*).
>
> We can review it after Leap is replaced for the next openSUSE release.
>
> (*) also, RHEL8 (and its derivated releases) suffer the same issues
>      and they aren't EOL yet.
>
> For most of us, I doubt the fallback logic would ever be used.

CentOS 8 stream went EOL over a year ago.  How many people have systems
stuck on RHEL 8 and are using them to do docs builds?

> When it becomes painful, we can drop it.
>
> Anyway, I'll let it for Jon to decide.

I still really don't think that adding that stuff is a good idea; our
scripts should behave the way people expect them to and not go rooting
around for alternative interpreters to feed themselves to.  I appreciate
that you want to make things Just Work for people, that is a great goal,
but this seems a step too far.

Thanks,

jon

