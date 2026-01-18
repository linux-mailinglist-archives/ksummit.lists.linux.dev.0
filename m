Return-Path: <ksummit+bounces-2786-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF8AD399EE
	for <lists@lfdr.de>; Sun, 18 Jan 2026 22:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 175F83001637
	for <lists@lfdr.de>; Sun, 18 Jan 2026 21:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F6B26CE3F;
	Sun, 18 Jan 2026 21:14:23 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78DF381AF
	for <ksummit@lists.linux.dev>; Sun, 18 Jan 2026 21:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768770863; cv=none; b=O8dG71JRBBdSGBCd2fJyF1VdWRA9qGq7nDtl+D5nUxOFeaRi5yUj6lZiOKUk6F9A0ovUwmfW3YE2wVAd7Qr4MPuZb9tVcf2nsXl+8xo7g2VzVgJV42GLHY3jXaZzzC13iEQ0Lt9Dj6KUXK0Q64Lwx1eA2rapFFhGYW0h8BSBLi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768770863; c=relaxed/simple;
	bh=UeReLyqPeeae1u6C75RcwhMLaFTC4K3UKQbIFG5seCU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JOTpBHmKCQStMm/tTZDh9no1dQ05yw40IJwYs50JwJB8DNjEdacMeo+mLlpCiDC9zzwT/fVL6Jm19MwiOWwmw432uF9K6/dzdJSfldsCuWoF0CbHB/rYcz/3neuiTuMDtu4Aod50huxfj8qta+tfZ7Xuxmxksj+uTl5l1kWUX3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 0F4131605BC;
	Sun, 18 Jan 2026 21:07:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 103E22000D;
	Sun, 18 Jan 2026 21:07:05 +0000 (UTC)
Date: Sun, 18 Jan 2026 16:07:04 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, ksummit@lists.linux.dev, Dan Williams
 <dan.j.williams@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <20260118160704.4f7dda8c@robin>
In-Reply-To: <d187bc4bb0ff1de7812cc4d1673a55b45cb59d68.camel@HansenPartnership.com>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
	<7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
	<aVUUXAKjiNroU5tR@black.igk.intel.com>
	<20260102095029.03481f90@gandalf.local.home>
	<38d7b19f-b6ff-437b-bc88-fa2047ca556a@p183>
	<20260118110454.4d51a50a@robin>
	<d187bc4bb0ff1de7812cc4d1673a55b45cb59d68.camel@HansenPartnership.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: pkr1rakmbwgz1hbx7pugnqzx6tjdcmze
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 103E22000D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/v9Ir5hD0TAoKL3nOazXQsjyf7wBJqFaM=
X-HE-Tag: 1768770425-990117
X-HE-Meta: U2FsdGVkX19+6szTaqzK58Jz/Zlimx8u3h1M/RO/Qt7CvzJJhwDChSZimL2MmUrM5AH7RZnRzk9CbeeGdgN9sgfT1Iwftvt13IzClYtPT1iVS1wZi2Zq30gyQVs+mD/x36Jaxni7gGqHKApT6tb4Cc65CmcEKm/ulmfRpHnAc35Usk+qCHrF1YsaAtBii3AslgvGDMNNE2JZO3BhSxdyzxQNWojA08tfg8amoG0Vu31XEtQ4NIuym48JimKub4LzGEJ25+42Sjmu513nIdYalASuNj26U5vp2CM1aBBv3hZnALnD5yFmRI0lVmpidzAt5N+lnhFXKXOx0ZJOFXnbCL58MQdFhWMSe0DFx04t9DHhmTwX9Fsnp3KbfPRFeIdY

On Sun, 18 Jan 2026 14:17:30 -0500
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> How is any of this relevant to a style document?  You're quibbling over
> individual maintainer foibles which, while they may be deeply held to
> you (and obviously are relevant to contributors to your subsystems

Not just me, there are other maintainers that feel this way.

> because they need to know your foibles), can't be part of our universal
> advice because not all maintainers agree (not even on the direction of
> the Christmas Tree).

I don't believe the direction is controversial with variable
declarations. Maybe for header files, in which case, either is fine
with me.

Again, it's mostly due to aesthetics and it's more of a guideline than
a rule (for me). I do know of other maintainers where they are more
strict about it than I am.

-- Steve


