Return-Path: <ksummit+bounces-1244-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 847EE906DB3
	for <lists@lfdr.de>; Thu, 13 Jun 2024 14:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C59F1F21F85
	for <lists@lfdr.de>; Thu, 13 Jun 2024 12:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23CE149002;
	Thu, 13 Jun 2024 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="qsX3oxAe";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="w5BXu2Bx"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96020148FE3
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718279945; cv=none; b=iOLjwNAiaIaMKpI7tjxZBBy5EcCeTsa+nrEED4/EuXPu/vEJtiBYl4mewutlkZskw6g64NCVTgYTq30GETVGKHat0kkV1tjYgPdV8yJ2CKgOdCi5RLTxJOrZ4Ypw3mfi2IYHbbeHSNx0ghoazhtzOnj6NOAhw0MdtMvoU1tiW4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718279945; c=relaxed/simple;
	bh=cjg8LHsJwy2ap/TTxtORlgARWWMUEDVhzupJGAnePuw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pAzk6NO0JQEgXzi9qdMkXeD5BQjNuNRGHKB/pd5DvfjZwGin+DDdoD+pmWMMneFl0Hn52SlV+SAcvLR6s77Kxflf5xMzptCCdJ7bmXygwAO61AqVajgFp3pCdobw9dBQ15d9U4ZJd4aQN0MWuUy1hfqjA3EodKVYliHhMRdauIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=qsX3oxAe; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=w5BXu2Bx; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718279941;
	bh=cjg8LHsJwy2ap/TTxtORlgARWWMUEDVhzupJGAnePuw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=qsX3oxAe9O15wKvXTenWJCH1MWDaPHnii287lA3sKj6BgK08IIk/uVgpoR0se24iw
	 l4yhcP2fBN+ihPBAzNe7yUE01MahTYzlryMdJwBmCerjSmbfl772nbBpeuX39dThwO
	 V1945YRyBAQ3bAelF2+E/WMmWZbOrvJbzXkBiCbY=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id BCEF5128686F;
	Thu, 13 Jun 2024 07:59:01 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id qKyElGYWewft; Thu, 13 Jun 2024 07:59:01 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718279940;
	bh=cjg8LHsJwy2ap/TTxtORlgARWWMUEDVhzupJGAnePuw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=w5BXu2BxG+72nY3p7hiHWE8DrZN9LFaRm8gGLKv0WKHBHPTGA510hH/jRDj7wPTzy
	 eDbQdxLfC1Nj3Hy0v2MU11XUqsSkWNx/JGWpx9BH+8ObFGdka5Z7LodHzxxV6JFyWX
	 /w+p7Ub/9BUtEMBU+aT6zc0u/kUiiy0txulNyZz0=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id A53E512867D3;
	Thu, 13 Jun 2024 07:59:00 -0400 (EDT)
Message-ID: <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev"
	 <ksummit@lists.linux.dev>
Date: Thu, 13 Jun 2024 07:58:58 -0400
In-Reply-To: <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2024-06-13 at 10:42 +0200, Thorsten Leemhuis wrote:
> The scenario shown at the start of the thread illustrates a problem I
> see frequently: commits with a Fixes: tag end up in new to stable
> series releases just days after being mainlined and cause regressions
> -- just like they do in mainline, which just was not known yet at the
> time of backporting. This happens extremely often right after merge
> windows when huge piles of changes are backported to the stable trees
> each cycle shortly after -rc1 is out (which even some kernel
> developers apparently are somewhat afraid to test from what I've
> seen).

I haven't really observed this for curated fixes.  For most subsystems,
patches with Fixes tags that are cc'd to stable tend to go steadily
outside the merge window.  Obviously a few arrive within it, but
usually at roughly the rate they arrive outside it.

What I observe in the merge window is huge piles of patches go into
stable *without* a cc:stable tag from the autosel machinery (and quite
a few even without fixes: tags).

So this does beg a couple of questions:

Since you have the figures, what's the proportion of regressions caused
by backports to stable without cc:stable tags?

Could we fix a lot of this by delaying autosel?  It tends to ramp up in
the merge window when everyone is concentrating on other things, so any
regressions it causes naturally get ignored for a couple of weeks.

James


