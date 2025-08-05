Return-Path: <ksummit+bounces-2077-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35486B1BB98
	for <lists@lfdr.de>; Tue,  5 Aug 2025 23:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5CF188CE8E
	for <lists@lfdr.de>; Tue,  5 Aug 2025 21:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA306222562;
	Tue,  5 Aug 2025 21:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcAmh+tg"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0AC78F2F
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 21:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754427870; cv=none; b=c8DroAfZ4aQl+/XOi+OYVU5fp/IiTLFR8RBCmUBPRobgp5HtfaxsjMO0eyicKlOUoFwA6560PsKtfbRMpLbh8hYWF/2tejdxLwaOuM97sXJPOpnK2v4JET9EzEws1QHzIXNoiorXjliDrrgW+uziYf2oZEfpurpbqKFhQVTRf+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754427870; c=relaxed/simple;
	bh=bgQVS8Fcg2jCUfhUQctGoNr4AHjvpAWNO0oZoVqmU3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWO1Na+2Mv3D/Xgs25xprfhe1TJj8QyqRJU1WnKn2K3QmD1NqFBD5S1JsCZ8iOTOsJn83l5l2xBIalgi39QnVIwRpvtFABmwdCschqoqwICNgBqsMy2oQ0zLDwVlOnO2aoaAqiMpNCScDtPY7vozz7uwJlPpPkKqSSXW/aLKrKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcAmh+tg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76500C4CEF0;
	Tue,  5 Aug 2025 21:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754427869;
	bh=bgQVS8Fcg2jCUfhUQctGoNr4AHjvpAWNO0oZoVqmU3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DcAmh+tg+MdehTJRpD5f1cvRuEet/GjIwpgF0/CcSTZWYPVBhHk7I/o6G8lB7r65o
	 dkkkoEJju8A/lARH/mVggq0jbmfsEo4gvk2zCXMz46TRPhln/WG86ZaO/GHmNzxt8E
	 TEsaz9JPgpl3bZ1MmB3S9AehP5mTGjTC1ckAP9JD3zuH/QBDYeS4uxCvYxCEsnmSq6
	 GnQIy5DDT3Uu7A2GkK1JXNTLUYdj7wAAEnJInZWg1KLdIdbYz+hWRWdF6Rfj5B0Dot
	 vo8LJ6WmCNeB2k7g2gg9ZHnUbg8qRvnHZ5xTvPzBmeE43ZrnaDW2jzxysklO1EDkqe
	 ZBJFczH0VYbzQ==
Date: Tue, 5 Aug 2025 17:04:27 -0400
From: Sasha Levin <sashal@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <aJJx21BMlFIN7KO7@lappy>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
 <20250805122828.68312a8d@gandalf.local.home>
 <aJI78KDWGq35K6W-@lappy>
 <20250805-mottled-granite-otter-3dadde@lemur>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250805-mottled-granite-otter-3dadde@lemur>

On Tue, Aug 05, 2025 at 01:59:10PM -0400, Konstantin Ryabitsev wrote:
>On Tue, Aug 05, 2025 at 01:14:24PM -0400, Sasha Levin wrote:
>> > Now, if something is marked for stable, I really don't want to be bothered
>> > that it made it to a stable tree. If I marked something for stable, sending
>> > me an email that it was applied is rather redundant.
>>
>> So I'd love to cancel the "Added to the stable tree" mails. I honestly
>> don't even know why they go out: my understanding that it was for
>> historical reasons where someone asked for those in the past, but I
>> really feel bad about sending those out because to me they are pure
>> spam.
>
>I can suggest that you write them to a public-inbox feed instead. We can then
>pull that into lore so they still show up for people performing context
>queries, but we don't ever deliver them via SMTP.

I wish I knew who actually uses it, so maybe we could just drop it
altogether :/

This predates the lei/lore days, so I'm a git concerned about making a
change like that if anyone is actually relying on those mails.

-- 
Thanks,
Sasha

