Return-Path: <ksummit+bounces-1316-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B8190D614
	for <lists@lfdr.de>; Tue, 18 Jun 2024 16:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEC601F228AC
	for <lists@lfdr.de>; Tue, 18 Jun 2024 14:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DBB14B06C;
	Tue, 18 Jun 2024 14:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="cuIb1U6T";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="cuIb1U6T"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBEE2139DA
	for <ksummit@lists.linux.dev>; Tue, 18 Jun 2024 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721835; cv=none; b=hqIglSce/Hp+hSfjXXaD2rKkkjnzzSMAebLxgYPCFqV+xT4bYdrfGPky22kyK3ZfJ31UctNjSfzOClHtKeYUAZEmqt+3sLNalJEQZ2elIyqJjOeyBi8YeUuugGkXvd/81+W/aYxn2fljdfAqG0Ps9sQIRzZujWF/UlRgaQSsNsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721835; c=relaxed/simple;
	bh=Ux8X8LZ8PpgHyfNlKRtRZxTJRElk6N4SwAbomWfLd+8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rizdcS5Fyi4V41GT0/k+oC8ztE8m4YwGRGSzmEM+lYjZmjpRPW7SSrdUo3FvLoZoCyaRphMowlZTuTwW1ch+W6b83KDE0T5Vv9imES5zoCm2g8DR6eJfQ/ALkv1QEInKDnk7SSOYJOdwVpb3gYETe2S35rxnv8Jrh62dztwW6Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=cuIb1U6T; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=cuIb1U6T; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718721832;
	bh=Ux8X8LZ8PpgHyfNlKRtRZxTJRElk6N4SwAbomWfLd+8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=cuIb1U6TTk9D0nEsakQuPlYZOASICQcuy9IyzfolDBI6r/gpzzuowhERk7j0QBjIx
	 hqtc/sn52EulKGAMEPDwm8faVFrD7ZF7pClL2EPZlQNw8Ap2Niosc22R+UfAuROW3Q
	 b7gxHdzPTLlHkoFHedd9cIie7Qr4X3lJGjkQdcac=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 61202128127F;
	Tue, 18 Jun 2024 10:43:52 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id fyZLndhqRaTG; Tue, 18 Jun 2024 10:43:52 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718721832;
	bh=Ux8X8LZ8PpgHyfNlKRtRZxTJRElk6N4SwAbomWfLd+8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=cuIb1U6TTk9D0nEsakQuPlYZOASICQcuy9IyzfolDBI6r/gpzzuowhERk7j0QBjIx
	 hqtc/sn52EulKGAMEPDwm8faVFrD7ZF7pClL2EPZlQNw8Ap2Niosc22R+UfAuROW3Q
	 b7gxHdzPTLlHkoFHedd9cIie7Qr4X3lJGjkQdcac=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id F07BA1280806;
	Tue, 18 Jun 2024 10:43:51 -0400 (EDT)
Message-ID: <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev"
	 <ksummit@lists.linux.dev>
Date: Tue, 18 Jun 2024 10:43:49 -0400
In-Reply-To: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2024-06-13 at 10:22 +0200, Thorsten Leemhuis wrote:
> Lo! I prepared four proposals for the maintainers summit regarding
> regressions I'll send in reply to this mail. They are somewhat
> related and address different aspects of one scenario I see
> frequently in different variations; so instead of repeating that
> scenario in slightly modified form in each of the proposals, I'm
> putting it out here once:

I think you're missing a piece here about how we actually find
regressions.  A lot, it is true, come from test suites running on the
mainline.  However, for obscure drivers and even some more complex
dependencies, the regression sometimes isn't discovered until it gets
into the hands of the wider pool of testers, often via stable.

This is important, because it emphasizes that zero regressions in
stable is impossible (and thus preventing backporting patches that
cause regressions is also impossible) if stable is the vehicle by which
some regressions are discovered.  Plus it also means that a backport
delay or cadence would actually delay discovery of some regressions
because the patches that cause them won't be seen by the configs that
run into them until they get put into stable.  There's also a longer
delay in discovery of the actual upstream commit because bugs in stable
need to be reproduced or at least identified in mainline before we can
fix them and the discoverers often have a harder time than mainline
users in helping with this.  This stable being both a vehicle for fixed
kernels and a testing platform for regressions is a tension I don't
think we can (or should) resolve.

So what should we do about this?  I think the first thing is to
recognize the important role stable plays in actually finding bugs. 
There already is a -rc tree for stable, but it doesn't actually seem to
be very useful in finding bugs (likely because the pool of testers is
too small), so perhaps we should discuss whether we could expand this,
or whether we really accept that non-rc stable is part of our testing
infrastructure.

The other thing I think would help is better tooling and advice to help
reporters find regressions in stable.  What we do a lot upstream is ask
if they can reproduce it in mainline.  However, not everyone is
equipped to test out mainline kernels, so we could do with helping them
bisect it in stable (note this can be time dependent: older stable
trees more naturally give rise to the question "has this been fixed
upstream" making mainline testing more of an imperative).

Regards,

James


