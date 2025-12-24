Return-Path: <ksummit+bounces-2685-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEEFCDCD9E
	for <lists@lfdr.de>; Wed, 24 Dec 2025 17:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 557093035243
	for <lists@lfdr.de>; Wed, 24 Dec 2025 16:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C4E328B5E;
	Wed, 24 Dec 2025 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HJtOuYp/"
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90168328B5F
	for <ksummit@lists.linux.dev>; Wed, 24 Dec 2025 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766593440; cv=none; b=t7VFObA91iMAp6c0Iifhv86r7/t1t2Y2zm72XU5hQhQatVZcoarW6cDG3HTgknf9Las9DOlt09lA6WOFNsQ2IOYHLNzphrIaobSxBHoZPkSEZ3rO5kaBjBX5necU/LQYR5J/JDxOq2U0Dzs1bgXfj28Ccy2VErmSpm6kUa3/XoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766593440; c=relaxed/simple;
	bh=7WV4T5nuWxBWWhHewV5tiqZjFlpfY8Yhcb5MtCObx84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYcZGbmi7LPfgnWNe+6NNqGk7aMvdAHXZsZe0JXIxqqUXAlZDZGD25gZ+T0vxH0SNMn5SjJoe5E6I9pgvsG5zcDZYmbAiwq7AQ6mu4ZiEZnYSGpCAdOt2QmsWh6crn0FlYuuqng79bQ81wSIAHPjd8ghusnrXN7zzy/0BbRQo/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HJtOuYp/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b73a9592fb8so1145262266b.1
        for <ksummit@lists.linux.dev>; Wed, 24 Dec 2025 08:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766593433; x=1767198233; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B+ZwzLNirOF+Nxyrl5IUrZXM9GbaHlaE6cKByPnKroI=;
        b=HJtOuYp/VhW+leXY/Zj6AtNCIZHcbQhUTKipApVSPOOC/Wv630Bw3lazEJPuTXxNj8
         I4ni45jWeHhwcbgO2lYx3MXCpP4Jhboa58MKxArkogg96ZQ+Xl6q3+HHMmzd68yLraMQ
         l0LVbgf7qmqPGzuPPdMIs6rgTkFiYgkAwzI3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766593433; x=1767198233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+ZwzLNirOF+Nxyrl5IUrZXM9GbaHlaE6cKByPnKroI=;
        b=i9VuFe4J6JmjMf/EwtuAc2DHlVFvIFkI+5IGP9qQJIlcRYVVYVUDNOrEOVaqsDJqW9
         Ock2NWag42AFz2YG8ba9wAYPkdzOGGH821DXU2ab5Jd4E/6aOt4Ns3BvS/sE3H+mJkOL
         tmWnF3aQ5R/pu718VnYX0QlncNAbsiRrJOW986DJFqusJhx/TdwZJ1G7wjee47Vmurts
         jLJjIqFL9Yn15bEeZRqUxwyvuw3yTjKmbk03hKJlcaFVS8JazTbta8nkWvRsT18pdc6v
         gIsKOfG+reVx1yc18kpwqVfwsLAmxuVLCucoYJJiuhWQ2MhXMmOz6ZWLMhQXNqQP/dBa
         QmMg==
X-Forwarded-Encrypted: i=1; AJvYcCUjWNyYqXBWh654cS8cndrbi1rVswqsfJaFEsBY0lwWwUeILgGz3k4KrV2DofYBR8kgN4c0u/FS@lists.linux.dev
X-Gm-Message-State: AOJu0YzfEzGzhJXLQZl1cwqoa3RvzIMmsWWzsO6hsyU8Yt4pKux2V+kQ
	Tt5u/Czk9Fc5d+S1ekG7YdW/dvLKmxNV25/oKCW6tpK1PWgHYJ0qs+SPsMmPq0tZQNII3S7AAVI
	dCRF6ISEqwFkarZZQxVgvqPlPZdNYERKdB6z1x2HD
X-Gm-Gg: AY/fxX46ctCi/zgSRvVgzMQWf8aXts5vEDme0wCbR3MMpwx1nhnE32RdHyvipa7WDAr
	vPkiqFk36BriaoRJswgtdQLsp4gtGhObnNdiimNF7iNx833k0kxlGhSW1e7imx7rwae16a3XmWW
	cs7CHpS9Ujps+ZWgNW55nRSteIIMQ4Rp+cMgKRHTewKjf/jCbv0TQLIkiJfU5K5dhjDhAilQl43
	ysqgx8wIIn+GumiCzzkM4VdjnEyFyfDIAbNYPobaqH/SRbTzEXOcVLOa8TRTvNKspyq2A==
X-Google-Smtp-Source: AGHT+IHrab0+kO4y0JQH91dach7KFNzglk360nuduWGFeAfxIGSG1kEXAf/RL4F8aIqSzYjSylJ87f0JC2QNWe99oEk=
X-Received: by 2002:a17:906:30d4:b0:b7c:cc8d:14f4 with SMTP id
 a640c23a62f3a-b8020400995mr1822714466b.4.1766593432970; Wed, 24 Dec 2025
 08:23:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
 <20251115140746.6a3acfd5@batman.local.home> <877bvqan70.ffs@tglx>
 <2804290.mvXUDI8C0e@rafael.j.wysocki> <EEF974E1-08D5-4E67-8AC4-4315CF9D10C1@kernel.org>
 <20251116111732.5159839e@batman.local.home> <2025122358-flyover-tidy-6f4d@gregkh>
 <87a4z9w2dl.fsf@trenco.lwn.net> <20251223155652.7c52630e@gandalf.local.home> <d0903ed7-e2db-4d8c-ab7f-0beb84760f07@sr71.net>
In-Reply-To: <d0903ed7-e2db-4d8c-ab7f-0beb84760f07@sr71.net>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 24 Dec 2025 09:23:44 -0700
X-Gm-Features: AQt7F2pPYuh-Vujbi48OAsni9r8b11fc7mGCDi8cjVLkwuPwny1V9yiTwFwNa-A
Message-ID: <CAFLszThGBdc9TOen9=hgkNQOhDUoRZgpj4QHts4we+_J7JuQBA@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Dave Hansen <dave@sr71.net>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, NeilBrown <neilb@ownmail.net>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan Williams <dan.j.williams@intel.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 08:47, Dave Hansen <dave@sr71.net> wrote:
>
> On 12/23/25 12:56, Steven Rostedt wrote:
> >>> What's the status of this patch?  I don't see it in linux-next, is it
> >>> supposed to go through some specific tree?
> >> I've been assuming there would be another version after the meeting, so
> >> haven't applied anything.  (Besides, between travel, 100mph winds, and
> >> several days without power, I've not gotten much done in general...)
> >>
> > Yeah. I was talking with Dave on the way to the Kill Bill evening event and
> > I believe he was planning on doing another version sometime when he got back.
> >
> > Dave correct me if I'm wrong.
>
> Yup, I was just waiting to post again until I know I can be attentive to
> email and responsive to an reviewers. It's definitely not dropped on the
> floor.
>

Reviewed-by: Simon Glass <simon.glass@canonical.com>

