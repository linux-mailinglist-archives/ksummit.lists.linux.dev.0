Return-Path: <ksummit+bounces-1423-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E72C9319E8
	for <lists@lfdr.de>; Mon, 15 Jul 2024 20:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D23B1F2201E
	for <lists@lfdr.de>; Mon, 15 Jul 2024 18:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F6425632;
	Mon, 15 Jul 2024 18:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="okYVem64"
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A041171C
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721066423; cv=none; b=U3JJ2uOuf0S5CzzjldZ9R3j1IykqUHFqlFixSsLcRx+Ng+2dI2mXS2FhQh91Fi2SMPbn8IpIPkwBf9UdmbRZtzX611Fyoy2yv0hQgebFvZ4AL5yoO9f2LxltwVnOA5JdCMxjE5vZiEjD1mHLSusBZaocAg4rc6Vle/gvXvD7v3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721066423; c=relaxed/simple;
	bh=5S4PxaKrKvqC0fWYMZ1CQJp4WkRYncvUDfkM5YGSiNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2pnUOuyRADc5U8Hiu3mlbmEpjScQpZrYw0Moavub+X8K4hf5KlDFh/MKuyoSEbU0/qq/aZlQwCAU94SKMnyFWnQRZVVBFp9KpWf5mkUlmobBb7q+Chuz+YFTgUM7O+tF0eZ3v79hB6YRFkoJoOFbjwHmBmQoRN1XpaVLpaw6k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=okYVem64; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-102-108.bstnma.fios.verizon.net [173.48.102.108])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 46FI014Z003158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 14:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1721066404; bh=eDbt6f4NOS9zp7qwZ0uaUPG5e3Ro/+jT3OWudP71V+I=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=okYVem64cS0fA0CnsED9cGdFwgVcnAIu20DE5ruHS9YKSAKCyNFUPdSDa7Ixsms/Y
	 PWMQXDIkGr0Oc0TPNH/7LgSB4ZYhNZlcNRrecN6els36s96l/1wwj5byUrEuujqzY4
	 5u+8sShnRt++BtqaFGGA1CxYbW6+pw58B/3ILQheq0V/3ZohtuhnjcWMTngGOuODzT
	 mW9ikkqvAQj6z7TGjsHwypSsFl8XBE0YWJ9mnS4YGgMMCbH/xiGaBj1wCieFN/kMdz
	 wZjcZnZ5H29VEGND50AcD648Xbs3JtYjz48akcYMr9f2+34QXvucWm3OI75wGN97H+
	 Ja0HDovTMqDnw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id E42BF15C029B; Mon, 15 Jul 2024 14:00:00 -0400 (EDT)
Date: Mon, 15 Jul 2024 14:00:00 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Sasha Levin <sashal@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <20240715180000.GC70013@mit.edu>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
 <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
 <ZpQyeLFJY1gJvRRA@sashalap>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpQyeLFJY1gJvRRA@sashalap>

On Sun, Jul 14, 2024 at 04:18:00PM -0400, Sasha Levin wrote:
> From my experience, most issues tracked by regzbot and fixed upstream
> don't actually have a stable tag. Here's one I just looked at a few days
> ago: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f451fd97dd2b78f286379203a47d9d295c467255
> 
> And I'm actually happy to point to that one as an example because the
> ext4 folks are usually great about stable tags.
>
> Should we have not taken that commit?

Yep, that's just a mistake on our (my) part; you should have taken
that commit, and my thanks for taking it without asking us.

That being said, maybe one path forward is that the stable team
*should* be asking the subsystem maintainers about.  "Hey, the
following commits appear to be backported, but you didn't add a cc:
stable.  We plan to backport them unless you complain."  This has the
benefit of giving feedback to the subsystem maintainers that they they
missed tagging some number of commits, which might remind them to do
better, or make them decide that they want to do something more
explicit, such as have their own stable backports initiative ala XFS.

More generally, it seems to me that we are conflating multiple issues
here in this discussion which may be making it harder for us make
progress on the question.

1) There are some subsystems who don't care about tagging commits,
   either Fixes: or Cc: stable, or both;

2) There are subsystems which are trying to appropriately tag commits, but:
   a) Sometimes they will make a mistake, and forget to cc: stable
   b) Sometimes it's too hard (tm) to figure out what is the commit which
      introduces the regression, so they either make up something (e.g.,
      hmm, it looks like commit XYZ changes one of the line that is touched
      by the patch, so <shrug emoji>), or they will add a Cc: stable but
      not supply a Fixes: tag
   c) They don't want it to get immediately pulled into stable, but might
     be OK if it gets pulled in after some period of time, or if someone
     actually does the regression testing first.

3)  There might be subsystems who believe 2c) applies to all of their commits,
    but they've been too passive-aggressive to explicitly tell the stable
    team to put them on the opt-out list.  :-)

						- Ted

