Return-Path: <ksummit+bounces-210-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7C63ACE20
	for <lists@lfdr.de>; Fri, 18 Jun 2021 16:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id AB7673E1104
	for <lists@lfdr.de>; Fri, 18 Jun 2021 14:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46052FB0;
	Fri, 18 Jun 2021 14:58:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF072
	for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 14:58:20 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id j8so5122520vsd.0
        for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 07:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sK1e1fPt0zMaEq6+4wMfGpXVrEHblA3IAhRYoTeadpQ=;
        b=oOh/0kW2AeNOWpUIXMtb4HEFtJkUuEBPUjns3aqV0niRuERRfKucl9wZ7QVhEh5rkC
         4urW87OQHqHm6CCT/qCzp0ATrmkqpdDCYdkPqlmJyM1WCzwJudvsfRUSc3PT6YXVhQy6
         JG5Tg+XXcIMsIPZ9uvoDRc6T2ZQ2rolVNcv92YmETwWgcw0tsRhMBkx6XWWGwARC49PQ
         X/7GAHghuDK7Dhq4QsF47QjY6mwKQ7CpEi/7nro4uVLk+UvyLPMhGE+lOECVuJBFuh3E
         HblXXe6AhoAMGOnXbz4DWzawUpS9z1siAuDaqS8PWSoA7Jek53+RlLACgHedIkJQI87W
         dUnw==
X-Gm-Message-State: AOAM532l4b/rZL9aQo9BElNAWtxJtTwiXUq9pUmVQFaFwcD7ziNGv/+Y
	KBnvqK8hPEwmu057YkOH7C3DYZ+svj76WfIuv5A=
X-Google-Smtp-Source: ABdhPJzg/YZ6W6Is0ERxgmyVpS1tDEBVcgjBpDhPONT5Qk7oJfA8+VdLNRMVYyTep7yhmxjZzTnU3vP2PEwuB0o2fxE=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr7549799vsd.42.1624028299731;
 Fri, 18 Jun 2021 07:58:19 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YIx7R6tmcRRCl/az@mit.edu> <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com> <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com> <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
 <20210610182318.jrxe3avfhkqq7xqn@nitro.local> <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
 <20210610152633.7e4a7304@oasis.local.home> <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
 <YMyjryXiAfKgS6BY@pendragon.ideasonboard.com> <cd7ffbe516255c30faab7a3ee3ee48f32e9aa797.camel@HansenPartnership.com>
 <CAMuHMdVcNfDvpPXHSkdL3VuLXCX5m=M_AQF-P8ZajSdXt8NdQg@mail.gmail.com> <20210618103214.0df292ec@oasis.local.home>
In-Reply-To: <20210618103214.0df292ec@oasis.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Jun 2021 16:58:08 +0200
Message-ID: <CAMuHMdWK4NPzanF68TMVuihLFdRzxhs0EkbZdaA=BUkZo-k6QQ@mail.gmail.com>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
To: Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	"Enrico Weigelt, metux IT consult" <lkml@metux.net>, David Hildenbrand <david@redhat.com>, Greg KH <greg@kroah.com>, 
	Christoph Lameter <cl@gentwo.de>, "Theodore Ts'o" <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>, 
	ksummit@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org, 
	Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
	netdev <netdev@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, 
	Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Steven,

On Fri, Jun 18, 2021 at 4:32 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> On Fri, 18 Jun 2021 16:28:02 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > What about letting people use the personal mic they're already
> > carrying, i.e. a phone?
>
> Interesting idea.
>
> I wonder how well that would work in practice. Are all phones good
> enough to prevent echo?

I deliberately didn't say anything about a speaker ;-)

Just use the mic, with a simple (web) app only doing audio input?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

