Return-Path: <ksummit+bounces-1282-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 342209091F6
	for <lists@lfdr.de>; Fri, 14 Jun 2024 19:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B078C2894EF
	for <lists@lfdr.de>; Fri, 14 Jun 2024 17:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E5A19E7FF;
	Fri, 14 Jun 2024 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMLQrakP"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4526B19E7C8
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 17:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718387209; cv=none; b=Lfp2zcf3/i4o3vbKDw08Xbdw0SoICojPCtvnM7mZa2JMgwcET9Jf7CGBnSvPdATaZz8VKgQ0pKxVCxqAvYTAuTAc6HGPHz6gqhNmDIreSBde2QDedzeRQ2EHnV7PmgCZKy6Rh5i3w+yWxoqiH62i5FsJXaNAJ+lVgTfOkJSf4kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718387209; c=relaxed/simple;
	bh=UIqwHycoNq5HiJI5rj2gJ4HzCu0jDaRDB4Agw2mmCQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxxT/Ww2EfAUYpdiq4iyZfOi15LSF+B+HsClnB4eJHbBG8QnIgCdUJLixsxp1xnaNSO2gxB7LcRe2hUCDYY28IBZiMNclVpp3pZKDb9Um8PbDfzUKJbKB5RSrewWAXfXLPxZOHdszrN6b08pJCS8Hamef016EmueXVd0Axrh4co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMLQrakP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0474C2BD10;
	Fri, 14 Jun 2024 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718387208;
	bh=UIqwHycoNq5HiJI5rj2gJ4HzCu0jDaRDB4Agw2mmCQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LMLQrakPkPEUqxq7aTEILKtnr4l/aAsMrG7NFzM6n+8tnbQxIgLZ6rOuGRnauGDL7
	 +F1WKdjwWB4YKBm41cdJ2dTHoMte78p9Z+HSOEScRyZL1V+UMHg+42vF7cf8uw5SVc
	 IQ1pvDZ2RE3WvMs3NDl22c59MLNnqOYAGrj4tSehUVn7FFfRNeDpDxsINMk+Cc4HQ8
	 5/RqjhwJq30g3DZpi3l2jCdn3uZOwCb9J7cUg0jn4WWlDbHvYR74omibeh/UX2r7Ix
	 8ZdF2TkuFGJ5x5YgeFK7WqIYgyEY7vEOcP8aYUrs5Ktb+0wsEgAu7fIpjufJE+BzL3
	 IbRgBvdBwVNWA==
Date: Fri, 14 Jun 2024 13:46:47 -0400
From: Sasha Levin <sashal@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Andrew Lunn <andrew@lunn.ch>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <ZmyCB3_euwlSjIGN@sashalap>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <0db30bc4-b646-43ec-bc0c-3b8b1372799d@lunn.ch>
 <Zms3F12AXGhErOrV@sashalap>
 <20240614144151.jun62q24lki5aqhj@quack3>
 <CAJZ5v0ih24UOwt9PpHYN3Cc868cwRzwj0eqk1v6kKq5Ca2oCVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0ih24UOwt9PpHYN3Cc868cwRzwj0eqk1v6kKq5Ca2oCVg@mail.gmail.com>

On Fri, Jun 14, 2024 at 05:03:17PM +0200, Rafael J. Wysocki wrote:
>On Fri, Jun 14, 2024 at 4:42 PM Jan Kara <jack@suse.cz> wrote:
>>
>> On Thu 13-06-24 14:14:47, Sasha Levin wrote:
>> > On Thu, Jun 13, 2024 at 04:28:47PM +0200, Andrew Lunn wrote:
>> > > > * One cause of regressions that happen in stable trees (and not in
>> > > > mainline) I've seen quite a few times are backports of commits with
>> > > > Fixes: tags that were part of a patch-series and depend on earlier
>> > > > patches from the series. The stable-team afaics has no easy way to spot
>> > > > this, as there is no way to check "was this change part of a series".
>> > >
>> > > This sounds like a tooling issue. git send-email knows a patch is part
>> > > of a patch series. Maybe it should be adding some sort of cross
>> > > reference between patches in a patch series.
>> >
>> > This came up in the past, and we have some machinery to check if a
>> > commit is part of a series or not, but in practice most of the series we
>> > see are actually not ones where patches depend on each other.
>>
>> I'm not sure I understand. Do you say most of the fixes you apply are
>> from single-patch series? Or if the series has multiple patches, how do you
>> decide whether some patch depends on other ones in the series or not?
>> Because judging that sometimes requires rather detailed knowledge of the
>> involved subsystem...
>
>Well, not always.  If the series is of the "clean up this same thing
>all over the place" type, you can easily say that there are no
>dependencies between patches in it.

Few subsystems also use good old patchbombs instead of pull requests,
which leads to patches being part of those series without actually
having anything to do with eachother.

I guess my point is that it's not as simple as looking whether a commit
is in a series or not.

-- 
Thanks,
Sasha

