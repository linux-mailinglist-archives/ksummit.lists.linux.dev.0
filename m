Return-Path: <ksummit+bounces-2080-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA91B1BC37
	for <lists@lfdr.de>; Tue,  5 Aug 2025 23:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B048618904C4
	for <lists@lfdr.de>; Tue,  5 Aug 2025 21:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0274624DCE2;
	Tue,  5 Aug 2025 21:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovPseWnk"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8AB3594C
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 21:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754431102; cv=none; b=TtqJdZ5Uy3NKX4sEiCdLvGOxqrKawRvKdfd/r1qC71b1FJo+Pn+Z3QIfoLciUMeJhZ83QjTyCWPyojSvMpWovsLn3W35QZv+qqWjEmRAfObdahAzDdTEedrEaklP3g9hfQHW+Wbhq8gSkvCvo3ZU/Mpai0/tvNQM2PBh7/zh1S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754431102; c=relaxed/simple;
	bh=n9yIzgZ/qLHSs3gVnOBOVnTniVC8QGAYuihPMfFmtGU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V6A8G5/Ia1paviV81JiA4HzfTPGeg3P1k5owSWdMHHiO2ylvuGIUuTvt4Oy+U9DUjsfp56R/3e7gzwWfIlW1iGEvIEIxcTR2WxtDMoIoGkdZQzQVuABl4uhUiBhGpWGtDleTn+4CfOQCxzRdWHWok1MuJcjoiXnJf9upT6nHGZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovPseWnk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42CCC4CEF0;
	Tue,  5 Aug 2025 21:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754431102;
	bh=n9yIzgZ/qLHSs3gVnOBOVnTniVC8QGAYuihPMfFmtGU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ovPseWnkiky75Q2kx0kIIsxdOTpYNzFf9sgTkv1yb9DJFxDLLASZfMvlXElC9LRAL
	 dRwh0IzE7myNCFk9H1W3cRw7hC98cjk3ok7/qaV5erWixm5+hWWberu9q2BzyfzAme
	 3GzkS1Xu7Et2AlV8hv+mEtXmdt9FoFf9kqKGxBbbpKA/qZe2ljy7gc8CHwiX314aUb
	 b4v7Uz//T6HmI8urEuIcWBazZJgQ/tzIEYOmjkLmMAHST/VNHhu0v2uZGF+zLhe6HJ
	 Q9jK1rhbxePDloCkyIcbYGCnr6rRVFE8VDBxfFTv54zt1aRb8bNyxGHAw2DRmTpndv
	 26Gmshi6shC4g==
Date: Tue, 5 Aug 2025 23:58:19 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
In-Reply-To: <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
Message-ID: <16p76q9o-7274-901o-4980-764o681q400o@xreary.bet>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local> <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Aug 2025, James Bottomley wrote:

> > * Equally, LLM's can introduce very subtle mistakes that humans find
> > difficult to pick up upon - humans implicitly assume that the classes
> > of errors they will encounter are the kinds other humans would make -
> > AI defeats that instinct.
> 
> Do you have any examples of this?  I've found the opposite to be true:
> AI is capable of really big stupid mistakes when it hasn't seen enough
> of the pattern, but I can't recall seeing it make something you'd
> classify as a subtle mistake (I assume it could copy subtle mistakes
> from wrong training data, so I'm not saying it can't, just that I
> haven't seen any).

Few months ago (so state of matters has probably changed a lot since 
then, I have no idea), I've seen a GPIO driver fully written by ChatGPT.

It was functionally correct and worked well. But it was missing error 
handle here-and-there. Is it subtle or big?

Thanks,

-- 
Jiri Kosina
SUSE Labs


