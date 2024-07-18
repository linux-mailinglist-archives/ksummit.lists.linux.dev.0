Return-Path: <ksummit+bounces-1445-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF52934F75
	for <lists@lfdr.de>; Thu, 18 Jul 2024 16:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FDFA282989
	for <lists@lfdr.de>; Thu, 18 Jul 2024 14:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D8F1411EE;
	Thu, 18 Jul 2024 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="m7oBjX1l";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="m7oBjX1l"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67889143726
	for <ksummit@lists.linux.dev>; Thu, 18 Jul 2024 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721314580; cv=none; b=rzC/joAYbWcra+OJcVL2aCGSuA1tV/0+2wbVKin3NcOSIw/s83l94unjwcQUoWHHFnSJXOlsNB9ulU4opnbUxwrBER7CXdLoDkBpRF0zvtU+HKJSOAGMdagAwth2Gcavm66TqJ1zLBQ2JpyHMnxUaqKvJVAg1wbZtWoXoZlS0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721314580; c=relaxed/simple;
	bh=KTJeHnO6Ll1oWd6mJxYu4TAx1vBaEwfD03Y8gGcnHLU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A79u06ahokCDTgNzFMTR6MDlKio9qZReOo/1APV0cuSe2jNvH7owW2POrfBFtbFbdryHrGsL60crwB8Y5Xq1ynwoEpljXRuNFnGg3wgzyIShmosmJc4YneVXZTz+THrfiNeEMkdLUcUcEcyYKE3ctz+c9LdyWgyd5npTn11bAtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=m7oBjX1l; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=m7oBjX1l; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721314578;
	bh=KTJeHnO6Ll1oWd6mJxYu4TAx1vBaEwfD03Y8gGcnHLU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=m7oBjX1l4zmhnjA1z6Vs7qS+cZG+cuU/3ngoez9m6dV2MQ9To+2186eVzQOEZ6S9O
	 f24djlwJhhYbf8VS7xJLRrBRO80BnyyxjMC0RYogL8l/Fn5WminzIYI0DB/pKwqIEc
	 b3VnvaFdXPkzE5uuAbmKsWeRpQFf9ao5ipDzKlBI=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 61D951285D88;
	Thu, 18 Jul 2024 10:56:18 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 3MODyhBok9su; Thu, 18 Jul 2024 10:56:18 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721314578;
	bh=KTJeHnO6Ll1oWd6mJxYu4TAx1vBaEwfD03Y8gGcnHLU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=m7oBjX1l4zmhnjA1z6Vs7qS+cZG+cuU/3ngoez9m6dV2MQ9To+2186eVzQOEZ6S9O
	 f24djlwJhhYbf8VS7xJLRrBRO80BnyyxjMC0RYogL8l/Fn5WminzIYI0DB/pKwqIEc
	 b3VnvaFdXPkzE5uuAbmKsWeRpQFf9ao5ipDzKlBI=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::db7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 24C80128179A;
	Thu, 18 Jul 2024 10:56:17 -0400 (EDT)
Message-ID: <631f4f690b90dd3047f60cb4b77591e73ad144e7.camel@HansenPartnership.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Takashi Iwai <tiwai@suse.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, Dmitry Torokhov
	 <dmitry.torokhov@gmail.com>, Theodore Ts'o <tytso@mit.edu>, Sasha Levin
	 <sashal@kernel.org>, ksummit@lists.linux.dev
Date: Thu, 18 Jul 2024 10:56:14 -0400
In-Reply-To: <0c1d7d04-8040-4843-8aec-59c155273f84@suswa.mountain>
References: <ZpQbQa-_8GkoiPhE@sashalap>
	 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
	 <ZpQyeLFJY1gJvRRA@sashalap> <20240715180000.GC70013@mit.edu>
	 <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
	 <ZpWK0m7Ps6Y4vjL2@google.com> <2024071605-bulb-plop-9cea@gregkh>
	 <87frs91qat.wl-tiwai@suse.de>
	 <ad9720d8-6b4e-4f7c-bf72-b3c2db8887d4@suswa.mountain>
	 <87v813w3v7.wl-tiwai@suse.de>
	 <0c1d7d04-8040-4843-8aec-59c155273f84@suswa.mountain>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2024-07-18 at 09:48 -0500, Dan Carpenter wrote:
> On Thu, Jul 18, 2024 at 09:34:04AM +0200, Takashi Iwai wrote:
[...]
> > It's no "regression", per se, but
> > a new feature that didn't exist in the past, after all.
> > 
> 
> If it's not a regression then don't add a Fixes tag.

Really, no, that's what got us into this issue in the first place: if
you only tag regressions with Fixes:, then we don't need cc:stable. 
Fixes: should be for anything that updated what was done in that prior
commit (including white space and spellings).  That way there's no
debate about whether it should apply and it's easy for Maintainers to
verify.

cc:stable should be for stuff that is backport worthy (regressions
etc), which does require some thought and a bit of guesswork.  And if
something later proves to be a bug fix that wasn't tagged cc:stable it
can be sent to stable later (and the Fixes: tag that wouldn't otherwise
have been applied under your proposed rule helps to locate what trees
it should be backported to).

James


