Return-Path: <ksummit+bounces-1141-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61577A36FE
	for <lists@lfdr.de>; Sun, 17 Sep 2023 20:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F76A281963
	for <lists@lfdr.de>; Sun, 17 Sep 2023 18:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F56A6D3F;
	Sun, 17 Sep 2023 18:10:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081CA636
	for <ksummit@lists.linux.dev>; Sun, 17 Sep 2023 18:10:03 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50300141a64so2154554e87.0
        for <ksummit@lists.linux.dev>; Sun, 17 Sep 2023 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694974201; x=1695579001; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nPh6x9aEfKjMFpChJgZC4Fil+eS6ir7xBAr4/X5FntY=;
        b=Mb+7nEkl6uFYGedOwx2QxnV6GyCfGgditnijd+n4a56r+R3n/FylgMBwo7yBH+KrOy
         3qW1gtkpMJT/G4xXL4ntXG9KzosGpHiwSI2lqHMEKugAkaKMgxe+NlugZ63UgEe10K2r
         wFL5GrHExlraAnjaeO3wYn/WDVyvEL9UicyQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694974201; x=1695579001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPh6x9aEfKjMFpChJgZC4Fil+eS6ir7xBAr4/X5FntY=;
        b=vm9TJpXlPno7UsKx+ta5F9u46nBfpGKy6K7t9KL8By+FFJ8VCJPyLrpsvK4Y9e9KX0
         meunjPAwB2MiNaA3KiJW49283FCzUbmasOi7FQfAlVqiw7+Xza3AjOYonG6CEHFChI7e
         4h8KbMXsSenAFW9V5IYMq9F+ZnsZTl2EpfRYzGAJe89ctcVODLlWKbq8CU9HQq0DC4DL
         KUzpXY6tMMoVIo8TUoIM7BwReOcfJJY/hjGIVPQHCjm36YyP8GmPm28/WKyyBjnzS8FF
         eBA+Y+GIh762piCXQbmfWmTm3IsINyQ+tj+gvfYBhzXBNmkuehYEHKTWA3QY/DphpnrE
         1wIA==
X-Gm-Message-State: AOJu0Yw7OuxgnSwcO/WrCRtjsHP+V8XSF2695w3+HF6suAGZDvGySVAh
	gaNr8Eyp6NfMT5Ss2F1THOYhBUahin4935YIsdgU7GMR
X-Google-Smtp-Source: AGHT+IH2feuZCS88RNoTse5duFV07AerZPVZG0bpMpDF8fwVWvpTVmOctHfIrA1CcWayl0XwNZurdA==
X-Received: by 2002:a05:6512:238b:b0:4fe:c98:789a with SMTP id c11-20020a056512238b00b004fe0c98789amr8386932lfv.37.1694974201679;
        Sun, 17 Sep 2023 11:10:01 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id s1-20020a19ad41000000b00500b6458ebfsm1485470lfd.229.2023.09.17.11.09.59
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 11:09:59 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50317080342so415352e87.2
        for <ksummit@lists.linux.dev>; Sun, 17 Sep 2023 11:09:59 -0700 (PDT)
X-Received: by 2002:a05:6512:525:b0:503:c45:a6e9 with SMTP id
 o5-20020a056512052500b005030c45a6e9mr1751068lfc.39.1694974199018; Sun, 17 Sep
 2023 11:09:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZO9NK0FchtYjOuIH@infradead.org> <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area> <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area> <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area> <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net> <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area> <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name> <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
In-Reply-To: <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 17 Sep 2023 11:09:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGXuGWftrSWgDgYPrW4devkTjE14CL4+us4igcNkVDJQ@mail.gmail.com>
Message-ID: <CAHk-=wjGXuGWftrSWgDgYPrW4devkTjE14CL4+us4igcNkVDJQ@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: NeilBrown <neilb@suse.de>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Dave Chinner <david@fromorbit.com>, Eric Sandeen <sandeen@sandeen.net>, 
	Steven Rostedt <rostedt@goodmis.org>, Guenter Roeck <linux@roeck-us.net>, 
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 Sept 2023 at 10:30, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Sure, it's old.

.. and since it happens to be exactly 32 years today since I released
0.01, I decided to go back and look.

Obviously fs/buffer.c existed back then too, but admittedly it was
even smaller and simpler back then.

"It's small" clearly means something different today than it did 32 years ago.

Today:

   $ wc -l fs/buffer.c
   3152 fs/buffer.c

Back then:

   $ wc -l fs/buffer.c
   254 fs/buffer.c

So things have certainly changed. LOL.

              Linus

