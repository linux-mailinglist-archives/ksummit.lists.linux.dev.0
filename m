Return-Path: <ksummit+bounces-1274-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E87C908DB6
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E2221C240A5
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2547D10A01;
	Fri, 14 Jun 2024 14:43:54 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A2FF9D9
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718376233; cv=none; b=lwM30YZEmBRl8BZbS4QFVtKrhMsCzxI7rtpdwjfjaZDziwx6eC3JoEaZI3ynbyk7s7hc7kj7E8sFYAWHZLwec15tOD7OxqNrAlPWkkbKEom325ZM9H9RzwLjCWepeSFYXN78FkWpOxIYbb6Dhy8SMgY4y+ZoTkcvaQAny3sr1Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718376233; c=relaxed/simple;
	bh=RMt4vDzLzGJyQBs5YnYNVcE0UmxG/Sx59ZB2m/ouFPs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMq/DzqMxX0OMDsmu3+TVN/b3OsCZ+elmCubZkhbBAAKuPAKNUGZyXeZVH0fjtLqzS5pJmbDPvXo+SU6u184qX9XDD4PJgNwzrMPhBfMWpTN2sYG3IZafESKXhpN+9wumnzeRwA49CCEDJHmwPrbVFXg2WvhN6hK0S/YAXmhI9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF975C2BD10;
	Fri, 14 Jun 2024 14:43:52 +0000 (UTC)
Date: Fri, 14 Jun 2024 10:43:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jan Kara
 <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240614104351.3385fd03@rorschach.local.home>
In-Reply-To: <87plsjoax6.fsf@mail.lhotse>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	<e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
	<20240613095917.eeplayyfvl6un56y@quack3>
	<20240613-rustling-chirpy-skua-d7e6cb@meerkat>
	<87plsjoax6.fsf@mail.lhotse>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 15 Jun 2024 00:29:09 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:


> Message-Id: sucks, I want a link I can open with a single click.
> 
> At your suggestion I switched to using https://msgid.link/ as the target
> for patch links, eg:
> 
>   Link: https://msgid.link/20240529123029.146953-2-mpe@ellerman.id.au
> 
> Which gives the reader a hint that the link is just to the submission.
> 
> I don't really care if the tag is "Link:", but it has to be a URL, not
> just a bare message-id that I have to cut and paste like it's the stone
> age.

I just switch my scripts over to Message-Id: and applied it, and after
playing with it a little, I agree with the above sentiment. I like
having a link to the actual patch that I can just click on. The
message-id adds more steps to get there.

I'm going back to the link, but I agree with others, "Link:" should be
for the discussions. Perhaps we could use "Pulled-from:" ?

-- Steve


