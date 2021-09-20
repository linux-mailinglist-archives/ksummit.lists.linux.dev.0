Return-Path: <ksummit+bounces-616-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7084118D4
	for <lists@lfdr.de>; Mon, 20 Sep 2021 18:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 92FE91C0772
	for <lists@lfdr.de>; Mon, 20 Sep 2021 16:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911843FCB;
	Mon, 20 Sep 2021 16:04:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7FE3FC7
	for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 16:04:02 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id h30so5198421vsq.3
        for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 09:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3dMifcbnkfSRVe/bi5rOjd4ROjtJjArQaEcU6dV9IRM=;
        b=X+nu4f6SQkt8SGyEUzIKeg5pYpL8ezhTqVf0omaRvLJCDV2xZ1EiQlLC3bd+fL/0kN
         Dg1tORMV+GE7lPdglXlhiC/9ltIC1jKeqRoPTcxgYgvZrDaiFe2qZt9uCm5LrIaDnqYU
         0VoYvz2jicF+gfjempoWZFGne3Q20DP8N9Y/VgmbGJ1I3kHhZfIApTfAzjZQ1NOCeYyG
         zURlwqAR7oLqkUhNmCQFP5Rbaj18nbPi1ZRbTSCevRD+65tCZgFl3avWjCItdFC4i0aS
         nKSorQlqHTM9I8Ioiwtpo9wkmFP2I5eJoBz0sKW+5UjkJb520ZrRQcQ5pWteut1KS6Y7
         n/vA==
X-Gm-Message-State: AOAM530Y0eE2DaqgZbBxkYPaO8rgCfwGHXSobJvAyN85Uqja6Y4Pu1K9
	xaDL09mgm8BREFX/Cp+jtgWYXmstLB+3/iIfvOyaRh5B
X-Google-Smtp-Source: ABdhPJx2uraiUOErFyJzXCe29wH/9CtnJzCdNfo89F3RZy1TJcNLDQmozi8h7VqjlVlyhgUEQ3q1hFky3vmS0tcBgY0=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr15980655vsl.37.1632153842016;
 Mon, 20 Sep 2021 09:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <44ee2bfe-e4bc-b918-b908-7352ea012524@oxidecomputer.com>
 <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net> <CAMuHMdUUfm6u_Pz3qzA0V7tLZd7jhcwdyxU7L0SyC_EdyzwQxw@mail.gmail.com>
In-Reply-To: <CAMuHMdUUfm6u_Pz3qzA0V7tLZd7jhcwdyxU7L0SyC_EdyzwQxw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Sep 2021 18:03:50 +0200
Message-ID: <CAMuHMdVtHDQ2f0VKAdQFQV9dZJ5uFGD9yHvNviQ_k7AEfhN77w@mail.gmail.com>
Subject: Re: IMPORTANT: CIVS opt-in for Technical Advisory Board voting
To: Dave Hansen <dave@sr71.net>
Cc: Laura Abbott <laura@oxidecomputer.com>, ksummit@lists.linux.dev, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"tech-board-discuss@lists.linuxfoundation.org" <tech-board-discuss@lists.linuxfoundation.org>, 
	"tab-elections@lists.linuxfoundation.org" <tab-elections@lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 20, 2021 at 5:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Sep 20, 2021 at 5:37 PM Dave Hansen <dave@sr71.net> wrote:
> > My @linux.intel.com account is the most common one from the git logs.  I
> > have only received one TAB-related email there:
> >
> >         Subject: Upcoming Technical Advisory Board election -- look for
> >                  your ballot
> >
> > However, I never actually received a ballot at that email, presumably
> > because of this CIVS opt-in issue.
> >
> > Was this just me?  Or would it be appropriate to send these opt-in
> > instructions to all of those that should have received a ballot instead
> > of just sending to the mailing lists?
>
> I did the CIVS opt-in, and entered the confirmation number.
> Still, unlike Vlastimil, I saw no way to vote?
> Just retried the opt-in, "already opted-in".

If you use multiple email addresses, make sure to opt-in using the exact
same one on which you received the original email from Laura.
Then there will be a link to the actual poll after entering the confirmation
code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

