Return-Path: <ksummit+bounces-2058-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749CB1B9B9
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86A4718444D
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3835E2957CD;
	Tue,  5 Aug 2025 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PM8Mk9K3"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DB42AD00
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754416752; cv=none; b=iC7ybMXsTDcUC7a++wq82GT6SwLf6u1n/clooH6p20uuRPsqaAFCZ4nBsIKgW5JE54v2pfbVe4Yjs5t6vyPh+uf83X+I/EIvHnRQSaz5yeLzJsF9+Gvg8f9XU3XCYRQegIKEaetv/WZe8DKgi4N+FtpucDG7GLrlsOgpmaXxWPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754416752; c=relaxed/simple;
	bh=kNN8YtIJ3UYkaTHCu7ve0GLBBkHpJV24RAx+MDDOsSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+WhGoSqMODV81H1DagLgzP8jxix5BVnu093an+3AfDgZHmvR0sUYts6S/VLZ4nJNWSokWKQhTEqo2jYPxWQNhLQZHlpslR2CWQi7nAVYBa68goKBmuChyPz/HNCI03JVjsxn3NVuhlhLZ5+RsK8ld0J2nfzTJv2e9uMuqd26Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PM8Mk9K3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3555C4CEF0;
	Tue,  5 Aug 2025 17:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754416752;
	bh=kNN8YtIJ3UYkaTHCu7ve0GLBBkHpJV24RAx+MDDOsSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PM8Mk9K357fiH3Q4qPwQM3lC8aIdYcxKQB/xJ/ngOOZfSi8mCGesVgPqJq1mqYS3F
	 vdByPXlIl5eigCp5XsHwhzatQg77TR5ZLUWmICgqVYK82O6loNKck2uoqOq/XLDyGb
	 +DVS1l6wvVop/fIP5f70m0vpZ06WKaQcF9dkki2o=
Date: Tue, 5 Aug 2025 13:59:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, 
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <20250805-mottled-granite-otter-3dadde@lemur>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
 <20250805122828.68312a8d@gandalf.local.home>
 <aJI78KDWGq35K6W-@lappy>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJI78KDWGq35K6W-@lappy>

On Tue, Aug 05, 2025 at 01:14:24PM -0400, Sasha Levin wrote:
> > Now, if something is marked for stable, I really don't want to be bothered
> > that it made it to a stable tree. If I marked something for stable, sending
> > me an email that it was applied is rather redundant.
> 
> So I'd love to cancel the "Added to the stable tree" mails. I honestly
> don't even know why they go out: my understanding that it was for
> historical reasons where someone asked for those in the past, but I
> really feel bad about sending those out because to me they are pure
> spam.

I can suggest that you write them to a public-inbox feed instead. We can then
pull that into lore so they still show up for people performing context
queries, but we don't ever deliver them via SMTP.

-K

