Return-Path: <ksummit+bounces-1246-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDAA9073F4
	for <lists@lfdr.de>; Thu, 13 Jun 2024 15:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F0E228ABF3
	for <lists@lfdr.de>; Thu, 13 Jun 2024 13:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C6E144D2C;
	Thu, 13 Jun 2024 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0oGojIr"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532161448E4
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718285958; cv=none; b=bZ+uFPO4AHiUPsz5qpDuH5pfF/ah8KalAojmLzglMlkhipdmyXsxebfH8v2vSOILo3ZTXVyk4MzOGMnuRA0w3MbBFuMHHrolfjqYJGkZ/0zdfM61jhx4TMb7yag6JctYod+KZb48b96fYK42+NlnfswsS/Pma9z+DYR717INPWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718285958; c=relaxed/simple;
	bh=/0jIyw34pld3xUXvXx1u9wHaL7OnaeIQ++WR+q+y/+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syz1EpetJTM7AMsWmxeu0Z2Vk1QZ29TDpgJSx2jMosYr782oCWRf20HevJGl+rC8Pl1SLX4rofBoQfYh7ecKW9UWWB2WkJcvejqFGPu2dc1QpZykWlpTzjyDVNL48OZ7SirNjECfHDLZ/qE5J9yNCKEdvNy1d7lngamAGOkMlBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0oGojIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CC7C2BBFC;
	Thu, 13 Jun 2024 13:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718285958;
	bh=/0jIyw34pld3xUXvXx1u9wHaL7OnaeIQ++WR+q+y/+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0oGojIrAZUFRTuEvWQt0UUMhTCwRUhNn/IT+5WtgjmeiaI2Byn11WgyjO6r6rebv
	 BPo/Cd2kur4PWP+JyH6o9fIn/KepyuWWxRdCXRn9N9ZxCdPqyL3pUQAFJuwtfXxLpT
	 QjuoMGHZT9xbCLM6kIYII7AURXMpOG1J1DurBSYlC6IvxHM5MQ1DtFIbpgM8LrlEUG
	 A+M3AN+UktoXjo35XUjEDhUCKcfWpZstxmd9l2OUuL01DwgxM3JVZTrGxBh9jO/6xI
	 v/1/T8nWuolaMW8CEhqrN37LMD2hLz02zSwv7t3Mak1bvNkPUnFeXQ+G7YkjH6DCBo
	 ZmsK2TcF+C7Vg==
Date: Thu, 13 Jun 2024 09:18:28 -0400
From: Sasha Levin <sashal@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [2/4] Ensure recent mainline regression are
 fixed in latest stable series
Message-ID: <ZmrwuE9REjmK4sDo@sashalap>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>
 <68ad780601dd5788ab7c18e8ba683e808cf98f4c.camel@sipsolutions.net>
 <2024061332-amazingly-haggler-de9a@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2024061332-amazingly-haggler-de9a@gregkh>

On Thu, Jun 13, 2024 at 01:21:15PM +0200, Greg KH wrote:
>On Thu, Jun 13, 2024 at 01:02:44PM +0200, Johannes Berg wrote:
>> On Thu, 2024-06-13 at 10:32 +0200, Thorsten Leemhuis wrote:
>> >
>> > I know I'm asking a lot here, especially from the file system folks due
>> > to the testing this will require. And I fully understand the
>> > participation in stable maintenance always has been and still is
>> > optional for mainline developers -- and that this would change it.
>> >
>> > But I'm bringing this up anyway, as users afaics expect "fix recently
>> > introduced problems with new minor releases'
>>
>> You are saying that users can have it both ways: not test each release,
>> but actually get fixes in each release...
>>
>> So no, I strongly object to putting *even* more work onto maintainers,
>> basically making us all responsible for stable releases.
>
>I also agree.  Remember, the FIRST rule of us doing a stable release at
>all was that we would NOT put any extra work on any maintainer or
>developer that did not want to do anything extra.  Let's not change that
>please.

Nor is this something we want to start policing on our end.

What happens if someone breaks this rule? Do we ban them from sending
stuff upstream?

-- 
Thanks,
Sasha

