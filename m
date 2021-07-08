Return-Path: <ksummit+bounces-360-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5063C1B45
	for <lists@lfdr.de>; Thu,  8 Jul 2021 23:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id CDDC33E110A
	for <lists@lfdr.de>; Thu,  8 Jul 2021 21:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433572FAF;
	Thu,  8 Jul 2021 21:56:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1CB72
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 21:56:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBBBE6190A
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 21:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625781412;
	bh=8mrPtbSTddfEM9gZfRj3kaiBXWnIoLVYwEeWvx6a8Gk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KMfMi44PR/BVf/rGww1JSQrH9AQf+PBDnhBTmMm0HjsrYHRn5uYvM1QQxVPaK9c/n
	 XW7XWf5ixiHrXnr7wcMbtubVeZBwR+FvbI0f/seX/uzs32VEpkzdZ3queuC3LiwR+1
	 0igr0HRgIfCyHfVT2eXwPUhp/K1gIps/GLAUjV2qCpjuHI7hP19K0DXUZBboATqIZR
	 XGwRrZdM8fts6iGjKX5HLaKWGq8oo7El0uT67c6aR4mVlJN9qC4jsphgHOdpHnMG76
	 biTQKocW4xndzG8Ohrk9Ei1yFyMRqRQq/Ab9ezF8lzReqnXG8BjTAountkRwJvIsv+
	 TIM3e2u6Uf1TA==
Received: by mail-ej1-f46.google.com with SMTP id o5so12317523ejy.7
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 14:56:52 -0700 (PDT)
X-Gm-Message-State: AOAM531LK0hph61+QOlJQvJfFVwNcOw15THPwZtluOBPUR0Muaxtemml
	Cg5kuT13pyqg4qlMeuigTE+cm0GmMbU0vWTCexN5ow==
X-Google-Smtp-Source: ABdhPJznEasKCo7zdaiI11+760K3W6d8YG7ABikPsdP9FEeAiXHLsI0qST0revtXKaAbXOutHy80FZfV5+YsAniBWkk=
X-Received: by 2002:a17:907:3f21:: with SMTP id hq33mr33080828ejc.101.1625781411304;
 Thu, 08 Jul 2021 14:56:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOdJLYmUkoMyszO7@kroah.com> <3D69F05C-A039-4730-957B-02BE4E06C547@amacapital.net>
 <CAMuHMdV-smViyOiEvEXcbR2Rjvh+TA0wkF+0y-vwbdcOMHWiUA@mail.gmail.com>
In-Reply-To: <CAMuHMdV-smViyOiEvEXcbR2Rjvh+TA0wkF+0y-vwbdcOMHWiUA@mail.gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 8 Jul 2021 14:56:39 -0700
X-Gmail-Original-Message-ID: <CALCETrWKbNuEjdFA3FEuD6WJH7mcCAr8HReFjaTe9TQ9=XNztQ@mail.gmail.com>
Message-ID: <CALCETrWKbNuEjdFA3FEuD6WJH7mcCAr8HReFjaTe9TQ9=XNztQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <greg@kroah.com>, Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	James Bottomley <james.bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Jul 8, 2021, at 12:35 PM, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
>
> =EF=BB=BFHi Andy,
>
> On Thu, Jul 8, 2021 at 9:31 PM Andy Lutomirski <luto@amacapital.net> wrot=
e:
>>>> On Jul 8, 2021, at 11:51 AM, Greg KH <greg@kroah.com> wrote:
>>> =EF=BB=BFOn Thu, Jul 08, 2021 at 02:36:40PM +0100, Wedson Almeida Filho=
 wrote:
>>>>> On Thu, Jul 08, 2021 at 08:11:10AM +0200, Greg KH wrote:
>>>>> Thanks for the detailed explainations, it seems rust can "get away" w=
ith
>>>>> some things with regards to reference counts that the kernel can not.
>>>>> Userspace has it easy, but note that now that rust is not in userspac=
e,
>>>>> dealing with multiple cpus/threads is going to be interesting for the
>>>>> language.
>>>>>
>>>>> So, along those lines, how are you going to tie rust's reference coun=
t
>>>>> logic in with the kernel's reference count logic?  How are you going =
to
>>>>> handle dentries, inodes, kobjects, devices and the like?  That's the
>>>>> real question that I don't seem to see anyone even starting to answer
>>>>> just yet.
>>>>
>>>> None of what I described before is specific to userspace, but I unders=
tand your
>>>> need to see something more concrete.
>>>>
>>>> I'll describe what we've done for `task_struct` and how lifetimes, ali=
asing
>>>> rules, sync & send traits help us achieve zero cost (when compared to =
C) but
>>>> also gives us safety. The intention here is to show that similar thing=
s can (and
>>>> will) be done to other kernel reference-counted objects when we get to=
 them.
>>>
>>> <snip loads of good stuff here, thanks for helping describe all of this=
>
>>>
>>>
>>>>> And that's the reason some of us are asking to see a "real" driver, a=
s
>>>>> those have to deal with these kernel-controlled-reference-counted
>>>>> objects properly (as well as hardware control).  Seeing how that is
>>>>> going to work in this language is going to be the real sign of if thi=
s
>>>>> is even going to be possible or not.
>>>>
>>>> Here's what I'd like to avoid: spending time on something that you all=
 still
>>>> think is not typical enough. Would you be able to point us to a driver=
 that
>>>> would showcase the interactions you'd like to see so that (once we hav=
e it in
>>>> Rust) we can have a discussion about the merits of the language?
>>>>
>>>> Hopefully something with interesting interactions with the kernel, but=
 not
>>>> with overly complex hardware, that is, something that doesn't require =
us to read
>>>> a 400-page specification to implement.
>>>
>>> Examples were provided in the first series that was submitted a few
>>> months ago.  What was wrong with them?  And really, there is no need to
>>> dig through a huge spec, try porting an existing C driver will be much
>>> easier.
>>>
>>> But if you didn't like the previous examples (nvme block driver, i2c
>>> driver, gpio driver), how about looking at the drivers used by your
>>> current desktop and picking something that you use today that actually
>>> talks to hardware?
>>
>> I would suggest a virtio device.  The core virtio guest code is horribly=
 unsafe, and various stakeholders keep trying to make it slightly less unsa=
fe. A Rust implementation of the entire virtio ring (or at least the modern=
 bits) and of some concrete device (virtio-blk?) would be quite nice.
>
> Another deviation from real hardware drivers? ;-)
> How many kernel maintainers have experience with writing a virtio driver?
>

Me?  Definitely more than zero :)

> What is wrong with something driving real hardware?

Nothing! But with virt hardware, anyone can test it.

That being said, the virtio case has real use cases from the secure
virt folks.  A Linux guest in a VM host that has untrusted virtio host
devices (TDX, SEV, various Xen or userspace host device driver
implementations, etc) wants to avoid being compromised by a
misbehaving virtio device.

--Andy


>
> Gr{oetje,eeting}s,
>
>                        Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                -- Linus Torvalds

