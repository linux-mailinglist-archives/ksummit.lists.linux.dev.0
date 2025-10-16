Return-Path: <ksummit+bounces-2561-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F2BE3CE7
	for <lists@lfdr.de>; Thu, 16 Oct 2025 15:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1612C188565F
	for <lists@lfdr.de>; Thu, 16 Oct 2025 13:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFE43376A5;
	Thu, 16 Oct 2025 13:50:56 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D233A03A
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622656; cv=none; b=cbaEbjJS0J0DsYfmxajP/4bQAuYTT/CxGz7ia76y7LQBnzsj1tkmgXUcNDSEU96+uj4QsT0huJoGerzvc1rjqrCTHbqCIhMJ8SNLAw9HZmyaf+a1x1YcoEPoCMVqypVlizQTskNaBkWyMwuICGi8q1PK5MYNxjaDUVfQSTza07k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622656; c=relaxed/simple;
	bh=5D0JVmvIl2U4swgB9Eg1QOfwBszG5jGTo+bmUUueXUs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WleFd4LMhnSZeABJy79Yk5PofK3jHjTedV6wVJ0pI1vDwA6h+MBTJVECJqC4uAf8nYCuMZLneVEHdy02tKTVxqbYsecefOsz23n9uS1ko2CzpZRz6HudDybxI0fG2akke1LjnVu2HY2QcU9fgxsEwPkI5MXjsPFskfyd/W4NfA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 7D578160302;
	Thu, 16 Oct 2025 13:50:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 5F2D92002C;
	Thu, 16 Oct 2025 13:50:50 +0000 (UTC)
Date: Thu, 16 Oct 2025 09:51:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Jiri Kosina <jikos@kernel.org>, Mathieu Desnoyers 
 <mathieu.desnoyers@efficios.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, dan.j.williams@intel.com, Doug Anderson
 <dianders@chromium.org>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251016095100.258ccafb@gandalf.local.home>
In-Reply-To: <7bba60baedc98bf2babc4b481ed5b3bdf7d3e565.camel@HansenPartnership.com>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
	<CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
	<68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
	<2025101448-overtake-mortality-99c8@gregkh>
	<68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
	<20251015-versed-active-silkworm-bb87bd@lemur>
	<CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
	<CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
	<2025101631-foyer-wages-8458@gregkh>
	<892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
	<2025101639-thwarting-press-f0f7@gregkh>
	<1de36a0c-a197-441d-82eb-29f96581a8b2@efficios.com>
	<8p635sn0-65r3-506n-3141-1316o85s539o@xreary.bet>
	<7bba60baedc98bf2babc4b481ed5b3bdf7d3e565.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5F2D92002C
X-Stat-Signature: rb747quq5otaoo4pjr5an1pdg6ks1itk
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19C0QK3Fr7zm1VyxVGLz0W1Gg0PkVPky5Y=
X-HE-Tag: 1760622650-601470
X-HE-Meta: U2FsdGVkX1/UeDqMKE6+L8lRzk/wED+vdRw7uyijirMypxYi1BnExpLa+DuUXf0mInBjt3ix3chp5OdUsr7bsQztR+rpX84zMqylQxZ7Ax+ik9O9Y7xpTy49wZdfA3/AN+quYvE1edJZhPu2unbdW262zTERGpGC4hAfmoAAUOFO7m0X5rWRWa24408vps9+mj+gpnnwC5y3HPY/uCYqmWjcX1j9zEzrnBC2G/dJtEogDjf4KCStINHuIIkjujjmLoMKRXCwPE4pfmq2O4bOWlzXX64bMDPgThBaXfOaU6MUPOMULQZZlHGe5CUN33rzgUFbimILOlMfdZaOcJg6emeom/1+aH9lbmaZipCLQHHudsI0bTBB6/aG3iUBmWzc

On Thu, 16 Oct 2025 08:54:26 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> ---
> I actually think this debate should be split into two
> pieces:
> 
>    1. What completely automated thing do we need to help tools with
>       tracking.  I think the message-id header would do that
>    2. What mindful thing could maintainers add to a commit to give
>       useful background information?
> 
> I think a lot of people want the former but Linus is asking for the
> latter and Link: has previously tried to serve both purposes which lead
> to the current dispute. I'm hoping splitting the discussion will
> produce something better on both fronts.
> ---


As I just replied to Konstantin, I do 1 via my automated scripts that puts
the link into the tags section, and 2 by placing the link outside the tags
section as it is meaningful for humans to read.

I will note, that I do not add 2 when a good discussion happened during a
patch submission. I only add 2 when another discussion lead to the patch
creation. 1 is for seeing if a discussion happened during patch submission
or not.

-- Steve

