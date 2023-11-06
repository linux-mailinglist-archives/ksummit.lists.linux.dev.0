Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B347E2944
	for <lists@lfdr.de>; Mon,  6 Nov 2023 17:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6BB1B20F89
	for <lists@lfdr.de>; Mon,  6 Nov 2023 16:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8532E28E33;
	Mon,  6 Nov 2023 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZjWV4xIp"
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9B028E31
	for <ksummit@lists.linux.dev>; Mon,  6 Nov 2023 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4ACA440E0173;
	Mon,  6 Nov 2023 15:53:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sE5cvlnMxjKO; Mon,  6 Nov 2023 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1699285981; bh=kKNHmGOI6DFaKQiwtzOltaE1dpaSS81vWy8Or6r3JI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZjWV4xIpxgzd0VlOLC8tXNnUve9QnXse+cfFtjJeBAGIef0mDjAYfOGb1ShoXW+Cv
	 ljfJsp78OJSrx2AVZ5w1AdSI9A77NVV+ICYinaNpyhqorEC7uuHa2apou2LXD9DGsv
	 ajeA5RCl4awLtIA5IeGEGTGXvViKdYy3WqY86OPuDzo/h9JAHX05pBTr06JDCUG6+E
	 Fn0TYzSm9qfqRNv+1GhEgLApOkDIguaIIVPvGEZd8xpMLleq93JPJbk7oPCuPm3Wzm
	 5+t5q8JCvjU3VQ7/QYnQFHQAVk2ofIS+vyHstWAJB5WSog0tSISFOVMOYNBXd9sYp8
	 89A1Gv/SiTDpmRrkkuqH9rVWDcwwgrqG8zqC5Hs2vgmxZc5hRPuRY5VnSf4E3mBmhE
	 0JiI9Ol8staRuhWVk5v23xjzsYxiJ/kYg8DdKK43f7Itc3rlKvJBJQWk4/PJKjauyc
	 o/iAlwdPUgCUh/7koisyUcvcfLCXmc5rhOB6JOYHVRcKnBrVbH1W4FIJ+o/jUsi46b
	 CuRR/gyqwft5U66EAxtUpcGouX60num8wgvqrmVgTE/Rp5/1bCGxtgnW8ZV13HI+6W
	 iMpYAt5ObIMAlgXDbVWybK5WrHKy0vX1VhfFXOlaIJC/5m6BlcExsmTw5kj4z0+L6i
	 KrRuQEKjZEmhzS16hE5qSgpk=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BCB6540E014B;
	Mon,  6 Nov 2023 15:52:58 +0000 (UTC)
Date: Mon, 6 Nov 2023 16:52:52 +0100
From: Borislav Petkov <bp@alien8.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231106155252.GBZUkL1IKeITpgzfZC@fat_crate.local>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>

On Mon, Nov 06, 2023 at 10:33:21AM -0500, Konstantin Ryabitsev wrote:
> Please let me know your thoughts. I will also be happy to discuss this at the
> upcoming kernel/maintainer summit.

Makes sense to me. We have always said that people should Cc: lkml for
archiving purposes so that we have the threads accessible somewhere
publicly and so that Link: tagging can work but that was before patches@
and lore happened. So as long as we can CC a ML in order to archive
discussions and submissions, we're good IMHO.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

