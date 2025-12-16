Return-Path: <ksummit+bounces-2674-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E6BCC4561
	for <lists@lfdr.de>; Tue, 16 Dec 2025 17:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C47C43062E7D
	for <lists@lfdr.de>; Tue, 16 Dec 2025 16:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEF430CD93;
	Tue, 16 Dec 2025 16:31:51 +0000 (UTC)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [144.76.133.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD1C30B52F
	for <ksummit@lists.linux.dev>; Tue, 16 Dec 2025 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.133.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765902709; cv=none; b=DhEYkybC7b4TLb5aLjSZV9DaBFUbGGPaWthbc3bIJqzrjz5pC2Z1R0N39gJHZZjuVJEcGtSiRo2vuK2Ik19eeUOM34BCV1OI3z1nAOV2R8K9l44taFxu7egKhyc9m+TJUCUjXxkbbE6VRa2jLYtIfui6w8d3YL8LjkRb2n1feC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765902709; c=relaxed/simple;
	bh=OpRlVXxe9XEH6nzrofUytNlrcJqJwV9TCIFUSCodI3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPbhqsRBe2ts5jx2mRJ0jS5WuGGayy6S0Y+d74y/AcwBkuKjAKfe6EyINGeTDkoc3iFeum8wyzW+L78nfw5I0dJjTkZarfhm1w+eaaYJoK9uDYd7U1SdPe68ZMxWxBll2rsW519kTlau3lLQIWMZWRnvNNGAkPpWtSZhS2Juq48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=144.76.133.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 642BA2C003DA;
	Tue, 16 Dec 2025 17:21:48 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 287074D9D; Tue, 16 Dec 2025 17:21:48 +0100 (CET)
Date: Tue, 16 Dec 2025 17:21:48 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: users@kernel.org, ksummit@lists.linux.dev
Subject: Re: kernel.org tooling update
Message-ID: <aUGHHFWe_CFuOnRJ@wunner.de>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-roaring-hidden-alligator-068eea@lemur>

[cc += Bjorn, start of thread is here:
https://lore.kernel.org/ksummit/20251209-roaring-hidden-alligator-068eea@lemur/
]

On Tue, Dec 09, 2025 at 11:48:24PM -0500, Konstantin Ryabitsev wrote:
> ### Bugzilla
> 
> It may be time to kill bugzilla:
> 
>     - despite periodic "we're not dead yet" emails, it doesn't appear very
>       active
>     - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
>       5.2 development branch and continuing with 5.1
>     - question remains with what to replace bugzilla, but it's a longer
>       discussion topic that I don't want to raise here; it may be a job for
>       the bugspray bot that can extend the two-way bridge functionality to
>       multiple bug tracker frameworks

The PCI subsystem relies heavily on bugzilla to track issues,
collect dmesg/lspci output from reporters and furnish them with
debug or test patches.

The SOP when issues are reported on the mailing list without
sufficient information is to ask the reporter to open a bugzilla
issue and attach full dmesg and lspci -vvv output for analysis.

If bugzilla is deprecated, we'll need at least a way to exchange
files with reporters.  Preferably on kernel.org infrastructure
to be independent from 3rd parties.  A way to communicate with
reporters outside the mailing list is also useful to prevent
spamming linux-pci@vger.kernel.org with messages relevant only
to a single issue or system.

All the information now recorded in bugzilla should continue
to be available indefinitely so that Link: tags in commits
continue to work.  It's not uncommon to have to dig in old
bugzilla entries in order to understand the motivation for
a particular code section that was introduced years earlier.

Thanks,

Lukas

