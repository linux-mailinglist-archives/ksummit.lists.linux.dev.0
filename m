Return-Path: <ksummit+bounces-2774-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B5D1B48E
	for <lists@lfdr.de>; Tue, 13 Jan 2026 21:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94CEB30B5142
	for <lists@lfdr.de>; Tue, 13 Jan 2026 20:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5A131AF3D;
	Tue, 13 Jan 2026 20:46:38 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE78E3195FD
	for <ksummit@lists.linux.dev>; Tue, 13 Jan 2026 20:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768337197; cv=none; b=QntFn68s+XLM2EeRqq0hdvEZodEIdlssdzik2gUP1lZYhb4zXplAH9wSUBj1sj08TT7G5RGFEygk2mmJvh2jl1fa4rKAjt++pbydo3wWu5uNlD4aqXLMieN9z06suk88aQXvsWZhIE38Un1kPuT5xTg+gji5lSk51hSsTCHAaQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768337197; c=relaxed/simple;
	bh=8q51W8p4lFL62dwhn7ILuet12kILdNK8mg5KalyWgM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPi7FaeBGQ4+L1w+LfnTHRSW3MP91zqdWDQcR6xLELw0rT9aHSj+d/m8GgdnagDaZ0L7FV6+21W/ahF2PbZPndOuHnoiN+H+aX5HPNriLRgWawqj3bvg9e/B1hpPkg2ucA8jn0lddRPLfLpU5hPnXu2s38pf/K7+hlZQmmAfA1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8c52c1d2a7bso21066885a.0
        for <ksummit@lists.linux.dev>; Tue, 13 Jan 2026 12:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768337195; x=1768941995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjWKof4076b+nCQR/PRIrOGanRyaKJuuJZgutI/yHYg=;
        b=o1y1sfgYDkveLOePvFQRfkT2e0yZuH688Z3dJQEULrGwNqhzL+uY4nI5JXIWs/vSec
         t93TOTaYdmUMa/p//YMt7LZVl2myZiGa2tkfLSSXJbz8FUVKX3RNG3Zk3j2qMBnTmjVZ
         bZcMCU70OqVS3k4XfQYylny30lAMWvfms7gPxk5V3ejooRCZgp92o8Iued8HvlstmMLI
         OW+sZGazQSyj/TIOwVN5XJmrKDtkfFKuBlB9z8triFl4nCd7zDf/1RwhKh5gKSJ7qL8N
         aFEH8wz5qn16fjpUVGLpZkXZMZdXdRhREi3KHmt7stOGLjf2CmTeNkXBRn+fB55kmuMI
         eKyA==
X-Forwarded-Encrypted: i=1; AJvYcCUQT533/rkdRnuvApf9RgqDp4NZsjl3b6PruuIftM9bZj6vh9IudLxvlF/E7D77torrp1gESNT5@lists.linux.dev
X-Gm-Message-State: AOJu0YyAT5IfYHuWvFr7QGAynQd1dDJP5IVD+aLg0n7h9+YXAN2Jbbu0
	p8dfg7PsdtJrFD5ZZjP7EJdpgqCLWbObB14m3DlJwJGShj17Vpbngh9cIi+ODAb9OdQ=
X-Gm-Gg: AY/fxX5SlZ7mP03k6x4xR3mxHhP5SLjw6dPRaGnb/53xXn/opbCE4NRWdKCvbYLuUPq
	u0pXhfg1dd+Dz5E9SOK3Sq5L4xcndfL42sSeG9v44rPlPD9IZOqaJSCEEwOBjz6M5VW9PhMHcJU
	odspeEDoH5zVZ/KPr9rZyS0qkEfbexnilUTS0voqfle7MUTC9Yr/25vzx6lVpPr5Beur0QBnBY1
	cMgf92bHgTHyIxXQuVhcqVntz+FzDY1d7AbGiFowS6svqmjuXdk/GAmhiEQAEAYg8PCbosKC/n3
	j6f0fDQe82lKC5dirYj3Xxe8bmDOnWizfNRwaunNmGA1ZXESAv5D1j7B8Mehky1uq6NhYMtzxcn
	ByVvtv5i2HFMnJ9zWx681s8LNt2RiGVaZ1pSbgK1HWAstButKG+6YWltALzw4pV563wKaVMMoFF
	8W2fda7G0btoaJY1D8fhJ7072Ze10kagEjKapx5+ppEt1AvkTz
X-Received: by 2002:a05:6102:38d4:b0:5ef:233e:6b25 with SMTP id ada2fe7eead31-5f16cb3b278mr1757910137.13.1768330517077;
        Tue, 13 Jan 2026 10:55:17 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124c087bsm20016318241.12.2026.01.13.10.55.16
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 10:55:16 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso86262241.0
        for <ksummit@lists.linux.dev>; Tue, 13 Jan 2026 10:55:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGsSA77q1k5J559aIN/1s1ASDNuHFjUfIB32zHeG9p+qBJidroyQCeeVDTDMENy2QckFWDNFiz@lists.linux.dev
X-Received: by 2002:a05:6102:38d4:b0:5ef:233e:6b25 with SMTP id
 ada2fe7eead31-5f16cb3b278mr1757899137.13.1768330516560; Tue, 13 Jan 2026
 10:55:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
 <20260113103609.GA1902656@google.com> <921e154d-7e54-40ff-ae85-97b6cee7f8b2@intel.com>
In-Reply-To: <921e154d-7e54-40ff-ae85-97b6cee7f8b2@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 19:55:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJX4DZzUuy9k8WBtRJm2QHdN=xQ9zfXudTPdHyLRvUrw@mail.gmail.com>
X-Gm-Features: AZwV_QhkcBOxhfA-T8w_e1l-LSq2Jx22XOANMJuW-iYC-FegHcdFGbGLo6DoatQ
Message-ID: <CAMuHMdUJX4DZzUuy9k8WBtRJm2QHdN=xQ9zfXudTPdHyLRvUrw@mail.gmail.com>
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for tool-generated content
To: Dave Hansen <dave.hansen@intel.com>
Cc: Lee Jones <lee@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Simon Glass <simon.glass@canonical.com>, 
	NeilBrown <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Jan 2026 at 19:05, Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 1/13/26 02:36, Lee Jones wrote:
> ...
> >> +Even if your tool use is out of scope, you should still always consid=
er
> >> +if it would help reviewing your contribution if the reviewer knows
> >> +about the tool that you used.
> >
> > Parsing ... okay, that took a few goes.  How about:
> >
> >   Even if disclosure of your tool isn't mandated, providing this contex=
t
> >   often helps reviewers evaluate your contribution more effectively.
> >   Clear documentation of your workflow ensures a faster review with les=
s
> >   contention.
> I agree that the sentence is hard to parse. But, I want to explicitly
> say "out of scope" to tie this in to the rest of the section. How about
> this?
>
>         Even if your tool use is out of scope, consider disclosing how
>         you used the tool. Clear documentation of your workflow often
>         helps reviewers do their jobs more efficiently.
>
> BTW, I do think we're well into diminishing returns territory. I'll roll
> this into a v6 if there's a v6. But, if it's pulled in as-is, I think
> the original can stay without causing too much harm.
>
> ...>> +Some examples:
> >> + - Any tool-suggested fix such as ``checkpatch.pl --fix``
> >> + - Coccinelle scripts
> >> + - A chatbot generated a new function in your patch to sort list entr=
ies.
> >> + - A .c file in the patch was originally generated by a coding
> >> +   assistant but cleaned up by hand.
> >> + - The changelog was generated by handing the patch to a generative A=
I
> >> +   tool and asking it to write the changelog.
> >> + - The changelog was translated from another language.
> >
> > Nit: Suggest removing the sporadic use of full-stops (periods) across a=
ll lists.
> >
> > Or add them everywhere - so long as it's consistent.
>
> The rule that I read is that when the bullets are full, complete
> sentences, you should use periods. When they are just nouns or shards of
> sentences, leave off the periods.

Or for the latter: use commas for all but the last one, and finish
with a period.

Just my 0.02=E2=82=AC, from an old LaTeX user...

P.S. Linus seems to disagree, as he consistently drops the carefully
     placed commas and periods when merging my pull requests...

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

