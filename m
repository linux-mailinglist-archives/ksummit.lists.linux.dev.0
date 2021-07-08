Return-Path: <ksummit+bounces-356-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7763C19E4
	for <lists@lfdr.de>; Thu,  8 Jul 2021 21:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id CACB73E109D
	for <lists@lfdr.de>; Thu,  8 Jul 2021 19:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9149E2F80;
	Thu,  8 Jul 2021 19:35:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3E1168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 19:35:41 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id f7so2787318vsa.9
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 12:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+Z/myeFkZENj37bNMJubQ5gjdM0mBCNxzVlxxkoz7HI=;
        b=W6qy2uyuUIdMj+81OAt1uWIjjN9Atz6yKX65v1KB05OCMZr4Ez0KWhD9oGxCgOCCSz
         KvnTCDVMXt5NO/a17vw/oUMTv2hjQZI16qUSWDEhxt8C/238OUHg/+JE+p1qYPkF1ADc
         vVDo0F7CQQU2GiA052nmLLMe0b5bTzdXWTYFMGmWR+H6Xw+6Tptpns4XTS6g5cX4G2ts
         q5/LB0BxiWb6JfH00EIsVtkyIG8PZxkUfiL1mYY/hqtNoO0R4QBm8ZiCvgaUDgQyrFn5
         uWyCOHYev4u8HSPkdsYJfaGpwYRN7Ph82pZf/hHz45CHuvjmRVvONfP3vIlJP4W3Y+i+
         VztQ==
X-Gm-Message-State: AOAM530g/RGhVpzdSJPFx8V+4I32oQoWCFsZguObtP7QR9zDSGgUdptN
	Fjux2iAGD6RrZjTJ8XMjInNhtwy+NpcFyK/IAyA=
X-Google-Smtp-Source: ABdhPJz5BJMvB6P2bA3BNpFjBIDBRpLBiiCxsl04CMeVHdmAjiyYfACt5YU4pfpY5tiJWDc+7iYl4w59CgkfCMjUmDs=
X-Received: by 2002:a67:f98c:: with SMTP id b12mr30675970vsq.40.1625772940134;
 Thu, 08 Jul 2021 12:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOdJLYmUkoMyszO7@kroah.com> <3D69F05C-A039-4730-957B-02BE4E06C547@amacapital.net>
In-Reply-To: <3D69F05C-A039-4730-957B-02BE4E06C547@amacapital.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jul 2021 21:35:28 +0200
Message-ID: <CAMuHMdV-smViyOiEvEXcbR2Rjvh+TA0wkF+0y-vwbdcOMHWiUA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Andy Lutomirski <luto@amacapital.net>
Cc: Greg KH <greg@kroah.com>, Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	James Bottomley <james.bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Thu, Jul 8, 2021 at 9:31 PM Andy Lutomirski <luto@amacapital.net> wrote:
> > On Jul 8, 2021, at 11:51 AM, Greg KH <greg@kroah.com> wrote:
> > =EF=BB=BFOn Thu, Jul 08, 2021 at 02:36:40PM +0100, Wedson Almeida Filho=
 wrote:
> >>> On Thu, Jul 08, 2021 at 08:11:10AM +0200, Greg KH wrote:
> >>> Thanks for the detailed explainations, it seems rust can "get away" w=
ith
> >>> some things with regards to reference counts that the kernel can not.
> >>> Userspace has it easy, but note that now that rust is not in userspac=
e,
> >>> dealing with multiple cpus/threads is going to be interesting for the
> >>> language.
> >>>
> >>> So, along those lines, how are you going to tie rust's reference coun=
t
> >>> logic in with the kernel's reference count logic?  How are you going =
to
> >>> handle dentries, inodes, kobjects, devices and the like?  That's the
> >>> real question that I don't seem to see anyone even starting to answer
> >>> just yet.
> >>
> >> None of what I described before is specific to userspace, but I unders=
tand your
> >> need to see something more concrete.
> >>
> >> I'll describe what we've done for `task_struct` and how lifetimes, ali=
asing
> >> rules, sync & send traits help us achieve zero cost (when compared to =
C) but
> >> also gives us safety. The intention here is to show that similar thing=
s can (and
> >> will) be done to other kernel reference-counted objects when we get to=
 them.
> >
> > <snip loads of good stuff here, thanks for helping describe all of this=
>
> >
> >
> >>> And that's the reason some of us are asking to see a "real" driver, a=
s
> >>> those have to deal with these kernel-controlled-reference-counted
> >>> objects properly (as well as hardware control).  Seeing how that is
> >>> going to work in this language is going to be the real sign of if thi=
s
> >>> is even going to be possible or not.
> >>
> >> Here's what I'd like to avoid: spending time on something that you all=
 still
> >> think is not typical enough. Would you be able to point us to a driver=
 that
> >> would showcase the interactions you'd like to see so that (once we hav=
e it in
> >> Rust) we can have a discussion about the merits of the language?
> >>
> >> Hopefully something with interesting interactions with the kernel, but=
 not
> >> with overly complex hardware, that is, something that doesn't require =
us to read
> >> a 400-page specification to implement.
> >
> > Examples were provided in the first series that was submitted a few
> > months ago.  What was wrong with them?  And really, there is no need to
> > dig through a huge spec, try porting an existing C driver will be much
> > easier.
> >
> > But if you didn't like the previous examples (nvme block driver, i2c
> > driver, gpio driver), how about looking at the drivers used by your
> > current desktop and picking something that you use today that actually
> > talks to hardware?
>
> I would suggest a virtio device.  The core virtio guest code is horribly =
unsafe, and various stakeholders keep trying to make it slightly less unsaf=
e. A Rust implementation of the entire virtio ring (or at least the modern =
bits) and of some concrete device (virtio-blk?) would be quite nice.

Another deviation from real hardware drivers? ;-)
How many kernel maintainers have experience with writing a virtio driver?

What is wrong with something driving real hardware?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

