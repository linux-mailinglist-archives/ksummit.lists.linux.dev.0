Return-Path: <ksummit+bounces-1294-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0772C909C97
	for <lists@lfdr.de>; Sun, 16 Jun 2024 10:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90D2B2810ED
	for <lists@lfdr.de>; Sun, 16 Jun 2024 08:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AADC5FB94;
	Sun, 16 Jun 2024 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9yIoeap"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A9171A7
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718526665; cv=none; b=M/nedBZtheL/rgGj64q4SfaETwVwuocs7dUxy837uox6qcRlvnLOO5bmZmC2kbOK6lb52XqpFcx4l47P763A4VxXbIyNHl3QuEv1vqsRWKJcII8gKLZ+ASPbL5Zshp9X8VIvAwBzADkLb6NBAobVWcd986kJWUsZpxc9jXq1TZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718526665; c=relaxed/simple;
	bh=gP2mUIUkV5ImN3MtOS0gPEBlF6a2qzhc3rVGAQ9VaaM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dhBgd5JYZ+eouuC09JkrtMnanM0ZIM0QFTnO27sGModmh7rjJscG1sGnGoDxjGrFlVTh1UqwXpioUEmsnGRAfmV2DYJ3jFH/Z0M4rGYBG5Kfyn+JrPdCBR6xZiDLoH5bQh32vwTANO2EQjqmarbtRBi5ITAsQjuojIVQ1Q40COE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9yIoeap; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A61C2BBFC;
	Sun, 16 Jun 2024 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718526664;
	bh=gP2mUIUkV5ImN3MtOS0gPEBlF6a2qzhc3rVGAQ9VaaM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A9yIoeapp1A4uyVcVsQaFcGgGVZr9TWyspUuSm377osILP9UalcLUcwjZLAxDGsv6
	 lDcSxWfVyx34iNTaOH+1QbNAu5PfTfB+U7oMRn1Klb1mKo1pMkl+tDaluEGUsEXZ2D
	 nSnE+WkASOSdoFINopcSHDwYq4HpsHV8kzll6K0IMKFJeT/gypr41RtWZjTsX6jFh4
	 1FMVjXPBJjqKyaVt2UzeLQw5iKgfuUQ29i9Bse3WInk8MzPPPC/dbLuew6uNQUOcxl
	 81MdhlnC0yGF9oXU2Iu+/5wtjTZeTHAfsV2g6raJwyTAb/oCvinAT/Y6jBf7p4gKlZ
	 jDhZ/v1ToXC4w==
Date: Sun, 16 Jun 2024 10:31:00 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Michael Ellerman <mpe@ellerman.id.au>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
    Takashi Iwai <tiwai@suse.de>, 
    Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
    Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>, 
    "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent backports
 of commits that turn out to cause regressions
In-Reply-To: <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2406161026100.24940@cbobk.fhfr.pm>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info> <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info> <20240613095917.eeplayyfvl6un56y@quack3> <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 15 Jun 2024, Linus Torvalds wrote:

> There is no excuse for that completely broken model. It's objectively
> and unquestionably worse than having a "link".

I think the 'philosophy' behind favoring Message-id over Link is that 
Message-id is set in stone forever, while Link is not.

Should lore go away at some point in the future, something else will 
probably take over, and you'll be able to search for Message-id there, but 
the Link will not be functional any more (sure, you can extract the 
Message-id: from it manually).

-- 
Jiri Kosina
SUSE Labs


