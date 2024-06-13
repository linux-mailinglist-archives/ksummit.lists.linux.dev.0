Return-Path: <ksummit+bounces-1241-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04211906AFF
	for <lists@lfdr.de>; Thu, 13 Jun 2024 13:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E83961C222C8
	for <lists@lfdr.de>; Thu, 13 Jun 2024 11:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554D2142E8E;
	Thu, 13 Jun 2024 11:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l2dydn96"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9561411E0
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718278152; cv=none; b=nrhIOF/UYy12utYda4q9Gvp1lXlkNGb2VfsdPQho05/dBN9wqiBr9v8oH6wg0J1w9Fvd+YX893qs8frmBEEy5HS8eSBiIVkP1r0uCJnS1Fyle5J93zmwnZMGj22F/3REhYAuse2yfZCwf4fi9W3F/W1PJKhRJZNYa1OKpXq3p/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718278152; c=relaxed/simple;
	bh=9Axk/9DsHDZ+jpbUvM6b5PlI4E7hDgimnqCnK/V1cio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awlykTNxUCv2iBOyIu6LST3NTjonjsPcdZMUfhcLzRi9RVegX8uK3ASyq9beOkRe/PR/AbEZfxqWB3zA/w+0sEzMFsurS4pRngbJFDRkf1fQS5590pdPQZv/dsdWa0KaHPV+7CVkxa+OxNhcOQ7Os9+KC5XzRjTWt7aG1srcgHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l2dydn96; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B9DF4CF;
	Thu, 13 Jun 2024 13:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718278135;
	bh=9Axk/9DsHDZ+jpbUvM6b5PlI4E7hDgimnqCnK/V1cio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l2dydn96E0blgeQOQsEcZR8n6ZfxJKzv5n24EqIL5wMIM38TItzfmaCxhVmnPkp8P
	 1Zgi7T308jr+/wVE0jtq8DUFIfqMNYwd8gT47PQ3ORF3x6aQ3ZWbKtbSuTaWMEXgqq
	 uYnh6KZDBwAV6LmUY5SAMgLEFLRyaSB2uHUM3bS0=
Date: Thu, 13 Jun 2024 14:28:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [2/4] Ensure recent mainline regression are
 fixed in latest stable series
Message-ID: <20240613112848.GG6019@pendragon.ideasonboard.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>

Hi Thorsten,

On Thu, Jun 13, 2024 at 10:32:27AM +0200, Thorsten Leemhuis wrote:
> I propose we extend the implications of the "no regressions" rule so
> that mainline developers must ensure fixes for recent mainline
> regression make it to the latest stable series.
> 
> [FWIW, yes I'm well aware that this is a bold proposal; I also have no
> idea how even Linus thinks about the idea. But I'm bringing it up anyway
> to at least discuss this, as from my point of view it would fix what I
> consider a kind of loophole regarding our "no regressions" rule -- at
> least from the point of view of the users.]
> 
> We might have a "no regressions" rule, but nothing currently makes sure
> that regressions introduced recently are fixed in a timely manner in the
> latest stable series. Hence a fix for a regression found just hours
> after a new mainline release (say 6.7) might only reach users weeks
> later with its successor (e.g. 6.8) -- or in unlucky cases when the fix
> is only merged in the next merge window and not backported only with the
> second successor (6.9). The example scenario at the start of this thread
> illustrates that in more details.
> 
> To improve this situation I propose we add a rule like the following
> somewhere:
> 
> """Developers must ensure that fixes for regressions introduced in the
> last development cycle make it to the latest stable series -- typically
> by adding 'Fixes:' and 'CC: <stable…' tags to the patch description's
> footer."""

I think there's a general agreement that those tags are useful, should
be used, and are already widely used. Reminding everybody, be they
maintainers or not, is fine with me. Making this an extra strict duty
for maintainers, however, is something I can't support. We already have
a bad maintainer burnout problem, and this would make it worse,
resulting in a worse long term outcome in my opinion.

I would be more interested in exploring why regression fixes don't end
up in stable releases in a timely manner, and seeing how we could
improve that at no cost for maintainers. We may even be able to come up
with processes and tools that, when used right, would save time for
maintainers. That would have a higher chance of getting broader
adoption.

> I know I'm asking a lot here, especially from the file system folks due
> to the testing this will require. And I fully understand the
> participation in stable maintenance always has been and still is
> optional for mainline developers -- and that this would change it.
> 
> But I'm bringing this up anyway, as users afaics expect "fix recently
> introduced problems with new minor releases', as it is a pretty normal
> thing in most other FLOSS projects that have minor releases. A lot of
> kernel developers are already doing what I proposed anyway. It could be
> viewed as fair to our user base, too. And without it the "no
> regressions" rule might be considered hollow.
> 
> Note, to quickly fix such regression in the latest stable series such
> regressions obviously must first be fixed in a timely manner in
> mainline; that aspect is ignored here, as proposals 3/4 of this thread
> will covers that.
> 
> Another note: the "Expectations and best practices for fixing
> regressions" in Documentation/process/handling-regressions.rst (see
> [1/4] kind of covers this already. But it does not use the term "must";
> at the same time the scope is bigger, too, which is partly due to a
> statement from Linus[1]: """If a regression made it into a proper
> mainline release during the past twelve months, ensure to tag the fix
> with "Cc: stable@vger.kernel.org", as a "Fixes:" tag alone does not
> guarantee a backport. Please add the same tag, in case you know the
> culprit was backported to stable or longterm kernels.""""
> [1]
> https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/
> 
> Side note: due to the [1] above the rule this messages proposes above
> maybe needs 's/introduced in the last development cycle/introduced in
> mainline versions released during the past 12 months/" (or five or six
> releases instead, as that is easier to keep track of?). But I guess with
> that this proposal likely would be even less welcomed. :-/

-- 
Regards,

Laurent Pinchart

